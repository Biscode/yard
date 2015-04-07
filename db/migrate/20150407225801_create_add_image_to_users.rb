class CreateAddImageToUsers < ActiveRecord::Migration
  def change
    create_table :add_image_to_users do |t|
      t.string :image

      t.timestamps null: false
    end
  end
end
