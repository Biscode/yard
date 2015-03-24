class User < ActiveRecord::Base

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
