class RemoveProjectFromSprint < ActiveRecord::Migration
  def change
    remove_column :sprints, :Project
  end
end
