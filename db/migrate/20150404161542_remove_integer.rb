class RemoveInteger < ActiveRecord::Migration
  def change
    remove_column :sprints, :integer
  end
end
