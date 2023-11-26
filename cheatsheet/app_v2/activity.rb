require_relative 'database'

class Activity < Struct.new(:id, :name, :completed)
  def self.create(name:)
    activity = new(name:, completed: false)

    sql = <<-SQL
      INSERT INTO activities
        (name, completed)
      VALUES
        (?, ?)
      RETURNING ROWID
    SQL

    completed = activity.completed ? 1 : 0

    result = Database.instance.db.execute(sql, activity.name, completed)

    activity.tap do
      activity.id = result[0][0]
    end
  end

  def self.all
    rows = Database.instance.db.execute(
      <<-SQL
        SELECT rowid, name, completed
        FROM activities
      SQL
    )

    rows.map do |row|
      id, name, completed = row

      Activity.new(id:, name:, completed: completed == 1)
    end
  end

  def update
    sql = <<-SQL
      UPDATE activities
      SET
        name = ?,
        completed = ?
      WHERE
        rowid = ?
    SQL

    Database.instance.db.execute(sql, name, completed ? 1 : 0, id)
  end
end
