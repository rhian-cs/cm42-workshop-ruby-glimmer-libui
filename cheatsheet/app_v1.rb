require 'glimmer-dsl-libui'

Activity = Struct.new(:name, :completed)

class App
  include Glimmer

  attr_accessor :new_activity_name, :activities

  def initialize
    @new_activity_name = ''
    @activities = [
      Activity.new(name: 'Buy lunch', completed: true),
      Activity.new(name: 'Deploy to production', completed: false)
    ]
  end

  def launch
    window('Todo List', 320, 320) {
      margined true

      vertical_box {
        grid {
          stretchy false

          label('What are you going to do today?') {
            hexpand true
            halign :center
          }
        }

        form {
          stretchy false

          horizontal_box {
            label('I will')

            entry {
              text <=> [self, :new_activity_name]
            }

            button('Add') {
              stretchy false

              on_clicked do
                add_todo
              end
            }
          }
        }

        table {
          editable true
          text_column('Name')
          checkbox_column('Completed')

          cell_rows <=> [self, :activities]
        }
      }
    }.show
  end

  def add_todo
    self.activities << Activity.new(name: @new_activity_name, completed: false)
    self.new_activity_name = ''
  end
end

App.new.launch
