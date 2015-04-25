class Addprojectid < ActiveRecord::Migration
  def change
	add_column :announcements, :project_id, :integer
  end
end
