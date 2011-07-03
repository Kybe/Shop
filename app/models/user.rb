class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :screen_name, :e_mail, :password, :password_confirmation
  validates_presence_of :screen_name, :e_mail, :password
  validates_uniqueness_of :screen_name
  validates_uniqueness_of :e_mail, :case_sensitive => false
  validates_length_of :screen_name, :within => 6..30
  validates_length_of :e_mail, :within => 6..50
  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 }
                       
  def has_password?(submitted_password)
    password == submitted_password
  end
  
  def self.authenticate(e_mail, submitted_password)
    user = find_by_e_mail(e_mail)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end
end
