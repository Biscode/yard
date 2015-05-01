class RemoveSprintFromTask < ActiveRecord::Migration
  def change
    remove_column :tasks, :sprint
  end
end
