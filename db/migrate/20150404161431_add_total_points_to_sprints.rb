class AddTotalPointsToSprints < ActiveRecord::Migration
  def change
    add_column :sprints, :totalPoints, :string
    add_column :sprints, :integer, :string
  end
end
