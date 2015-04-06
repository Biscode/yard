class Team < ActiveRecord::Base
  has_many :user_team_relationships
  belongs_to :project
  has_many:users, through: :user_team_relationships


  def self.find_team(team_id)
    Team.find(team_id).name
  end
end
