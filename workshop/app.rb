require 'glimmer-dsl-libui'
require_relative 'activity'

class App
  include Glimmer

  attr_accessor :activities, :new_activity_name

  def initialize
    @activities = Activity.all
    @new_activity_name = ''
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
                self.activities << Activity.create(name: new_activity_name)
                self.new_activity_name = ''
              end
            }
          }
        }

        table {
          editable true

          text_column('Name')
          checkbox_column('Completed')

          cell_rows <=> [self, :activities]

          on_edited do |row_index, activity|
            activity.update
          end
        }
      }
    }.show
  end
end

App.new.launch
