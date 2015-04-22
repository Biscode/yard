class AddIsprivateToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :isPrivate, :boolean
  end
end
