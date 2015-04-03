class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password

  has_many :user_team_relationships
  has_many :teams,through: :user_team_relationships


#email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+)\z/i

validates :email, :email => true
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create


  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

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

def add_to_team(user,team)
	team.users << user
end
end
