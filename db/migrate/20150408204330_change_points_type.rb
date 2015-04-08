class ChangePointsType < ActiveRecord::Migration
  def up
  change_column :sprints, :total_points, :float
  end

  def down
  change_column :sprints, :total_points, :integer
  end
end
