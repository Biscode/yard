class CreateDtasks < ActiveRecord::Migration
  def change
    create_table :dtasks do |t|

      t.references :user	

      t.integer :pid
      t.integer :snum
      t.float :story_points
      

      t.timestamps null: false
    end
  end
end
