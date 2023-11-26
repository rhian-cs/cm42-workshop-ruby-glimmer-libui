require 'sqlite3'
require 'fileutils'
require 'singleton'

DATABASE_DIRECTORY = 'tmp/'
DATABASE_PATH = 'tmp/app.db'

class Database
  include Singleton

  attr_accessor :db

  private

  def initialize
    FileUtils.mkdir_p DATABASE_DIRECTORY

    @database_exists = File.exist? DATABASE_PATH
    @db = SQLite3::Database.new DATABASE_PATH

    initialize_database unless @database_exists
  end

  def initialize_database
    @db.execute <<-SQL
      CREATE TABLE activities (
        name VARCHAR(255),
        completed BOOLEAN
      )
    SQL
  end
end

Database.instance
