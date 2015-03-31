class AddAtributes < ActiveRecord::Migration
  def change
	add_column :users, :fname , :string 
	add_column :users, :lname , :string
	add_column :users, :birthday , :date 
	add_column :users, :country , :string 
	
  end
end
