class RemovetotalPoints < ActiveRecord::Migration
  def change
    remove_column :sprints, :totalPoints
  end
end
