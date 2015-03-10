class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

    	t.string "first_name"
    	t.string "last_name"
    	t.string "gender"
    	t.string "email"
    	t.string "password"
    	t.string "country"
    	t.date "birth_date"
    	t.string "company"


      t.timestamps null: false
    end
  end
end
