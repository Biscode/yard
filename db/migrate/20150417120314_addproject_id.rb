class AddprojectId < ActiveRecord::Migration
  def change
	add_column :announcements, :project_ID, :integer
  end
end
