class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|

    	t.integer "project_id"
      t.integer "user_id"

    	t.string "title"
    	t.text "description"
    	t.string "status"
    	t.string "priority"
    	t.date "deadline"

      t.timestamps null: false
    end
    add_index("tasks","project_id")
    add_index("tasks","user_id")
  end
end
