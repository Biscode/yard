class ChangePointsName < ActiveRecord::Migration
  def change
    rename_column :sprints, :totalPoints, :total_points
  end
end
