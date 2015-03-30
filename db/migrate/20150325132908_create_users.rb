class CreateUsers < ActiveRecord::Migration
  def up
     drop_table :users
     create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.timestamps null: false
    end
  end
end