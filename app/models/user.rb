class User < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new { |controller, model| controller.current_user }

  has_many :user_team_relationships
  has_many :teams,through: :user_team_relationships
  has_many :tasks
  has_many :dtasks  



  attr_accessor :password
  before_save :encrypt_password
#validatios for email and password the email uses gem
  validates :email, :email => true
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
#it authenticate if the email and password are in the data base or not after signing up
 def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end


#for the search in the forum
def self.search(search)
  if search
      find(:all, :conditions => ['name LIKE?', "%#{:search}%"])
    else
      find(:all).order("created_at DESC")
    end
  end

  
  #it encrypt the password before it saves it for more secuity
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
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
