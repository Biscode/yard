class AddSprintToTask < ActiveRecord::Migration
  def change
    add_reference :tasks, :sprint, index: true
    add_foreign_key :tasks, :sprints
  end
end
