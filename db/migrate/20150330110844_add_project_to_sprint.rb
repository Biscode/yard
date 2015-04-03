class AddProjectToSprint < ActiveRecord::Migration
  def change
    add_reference :sprints, :project, index: true
    add_foreign_key :sprints, :projects
  end
end
