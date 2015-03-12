class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :status
      t.string :priority
      t.float :story_points
      t.date :deadline

      t.timestamps null: false
    end
  end
end
