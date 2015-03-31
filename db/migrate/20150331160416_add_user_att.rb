class AddUserAtt < ActiveRecord::Migration
  def change
	add_column :users, :birthday , :date 
	add_column :users, :country , :string
  end
end
