class User < ActiveRecord::Migration
  def change
	create_table :users do |t|
		t.string :name	 
		t.string :email
		t.timestamps :birthday	
		t.string :country
		t.string :projects
		t.string :achievments

		t.timestamps null: false
  end
end
