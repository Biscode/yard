class AddTotalPointsToSprint < ActiveRecord::Migration
  def change
    add_column :sprints, :totalPoints, :integer
  end
end
