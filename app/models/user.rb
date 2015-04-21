class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 include PublicActivity::Model
  tracked owner: Proc.new { |controller, model| controller.current_user }

  has_many :user_team_relationships
  has_many :teams,through: :user_team_relationships
  has_many :tasks
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  attr_accessor :password

#for the search in the forum
def self.search(search)
  if search
      find(:all, :conditions => ['name LIKE?', "%#{:search}%"])
    else
      find(:all).order("created_at DESC")
    end
  end

def self.search(query)
    # where(:email, query) -> This would return an exact match of the query
    where("email like ?", "%#{query}%")
end

## Ahmed Saleh
## takes a user_id and returns the user email
def self.find_user(user_id)
    User.find(user_id).email
end
end
