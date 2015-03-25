class User < ActiveRecord::Base

  attr_accessor :password
  before_save :encrypt_password
  



#email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+)\z/i

validates :email , :presence => true,
      #     :format => { :with =>email_regex},
           :uniqueness =>{ :case_sensitive => false} 
 

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

end
