require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  
  attr_accessor :password
  
  validates :email, :presence => true
  validates :email, :uniqueness => true
  
  validates :password, :confirmation => true
  validates :password_confirmation, :presence => true
  
  before_validation :downcase_email
  before_save :set_password
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  private
  
  def set_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, self.password_salt)
    end
  end
  
  def downcase_email
    self.email_address.downcase!
  end
end
