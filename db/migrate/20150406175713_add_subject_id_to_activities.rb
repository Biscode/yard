class AddSubjectIdToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :subject_id, :integer
  end
end
