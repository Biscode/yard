class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.integer :number
      t.date :deadline

      t.timestamps null: false
    end
  end
end
