class UserTeamRelationship < ActiveRecord::Base
	belongs_to :user
	belongs_to :team


  def username_in_team(usernameuser,team_id)
    user_selected = User.where(["username = ?", usernameuser]).first.teams
    user_selected.each do |team|
  if user.selected.select(:id) == team_id
          return true
     else 
          return nil
      end
    end
  end


end
