class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.text :announcement
		 t.references :project, index: true
      t.timestamps null: false
    end
	  add_foreign_key :announcements, :projects
  end
end
