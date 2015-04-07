class AddTeamToTask < ActiveRecord::Migration
  def change
  	 add_reference :tasks, :team, index: true
     add_foreign_key :tasks, :teams
  end
end
