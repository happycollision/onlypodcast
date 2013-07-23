require 'digest/sha1'
class AdminUser < ActiveRecord::Base
  
  attr_protected :salt, :hashed_password
  
  attr_accessor :password # automatically creates read and write methods for AdminUser.password instance variable

  # Need form validations here


  # Validation of password presence on creation
  validates_length_of :password, :within => 8..50, :on => :create

  before_save :create_hashed_password
  after_save :clear_password
  

  def name
  	"#{first} #{last}"
  end
  
  def self.make_salt(username='')
  	Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
  end

  def self.hash_with_salt(password='', salt='')
  	Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end
  
  def self.authenticate(username='', password='')
    # We actually need both values...
    unless password.blank? || username.blank?
      # Query for username
      user = AdminUser.find_by_username(username)

	    # Encrypt and compare passwords
    	if user && user.password_match?(password)
	    	# If they match, return user object
      	return user
      else
      	# If not, return false
      	return false
      end
    end
    return false
  end
  
  def password_match?(password='')
  	hashed_password == AdminUser.hash_with_salt(password, salt)
  	#true
  end
  
  private
  
  def create_hashed_password(password='')
    # When :password has a value, we need to hash it
    unless password.blank?
      self.salt = AdminUser.make_salt(username) if salt.blank?
      self.hashed_password = AdminUser.hash_with_salt(password, salt)
    end
  end
  
  def clear_password
    self.password = nil
  end
  
end
