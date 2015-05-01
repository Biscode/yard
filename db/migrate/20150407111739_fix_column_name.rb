class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :comments, :pin_id, :task_id
  end
end
