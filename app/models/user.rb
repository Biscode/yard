class User < ActiveRecord::Base

<<<<<<< HEAD
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

=======
attr_accessor :password

email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+)\z/i
	

validates :username , :presence => true,
          :length            => { :maximum => 50}
validates :email , :presence => true,
          :format            => { :with =>email_regex},
          :uniqueness        =>{ :case_sensitive => false} 
validates :password , :presence => true,
           :confirmation         =>true,
              :length            => { :within => 6..40}

  before_save :encrypt_password

  def has_password?(submitted_password)
  	encrypt_password ==encrypt(submitted_password)
  end
def self.authenticate (email,submitted_password)
	user = find_by_email(email)
	return nil if user.nil?
	return user if user.has_password?(submitted_password)
>>>>>>> e463d7fa3dcca0f56e59cb91c0b75f09ceef19ed
end
private
def encrypt_password
	self.salt =Digest::SHa2.hexdigest("#{Time.now.utc}  #{password}") if self.new_record? #{pa}
	self.encrypt_password =encrypt(password)
end
def  encrypt(pass)
	Digest::SHa2.hexdigest("#{self.salt}  #{pass}")
	
end

              
 end
