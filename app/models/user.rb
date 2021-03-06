class User < ActiveRecord::Base

  attr_accessor :password
  attr_accessible :email, :password, :password_confirmation

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,    :presence => true, :format  => { :with => EMAIL_REGEX }, :uniqueness   => true
  validates :password, :presence => true, :length  => { :within => 6..40 },     :confirmation => true

  before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  private

  def encrypt_password
    self.salt = make_salt if new_record?
    self.encrypted_password = encrypt(password)
  end

  def encrypt(pass)
    secure_hash("#{salt}--#{pass}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(pass)         []
    Digest::SHA2.hexdigest(pass)
  end
end
