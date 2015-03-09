class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :status
      t.text :description

      t.timestamps null: false
    end
  end
end
