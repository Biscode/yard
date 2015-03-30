class User < ActiveRecord::Base
	has_many :user_team_relationships
	has_many :teams,through: :user_team_relationships

def self.search(query)
    # where(:email, query) -> This would return an exact match of the query
    where("email like ?", "%#{query}%") 
end
end
