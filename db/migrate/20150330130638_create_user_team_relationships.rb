class CreateUserTeamRelationships < ActiveRecord::Migration
  def change
    create_table :user_team_relationships do |t|
      t.belongs_to :team , index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
