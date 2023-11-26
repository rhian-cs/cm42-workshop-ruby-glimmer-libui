require 'glimmer-dsl-libui'

require_relative 'activity'

class App
  include Glimmer

  attr_accessor :new_activity_name, :activities

  def initialize
    @new_activity_name = ''
    @activities = Activity.all
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

          on_edited do |_row, activity|
            activity.update
          end
        }
      }
    }.show
  end

  def add_todo
    self.activities << Activity.create(name: @new_activity_name)
    self.new_activity_name = ''
  end
end

App.new.launch
