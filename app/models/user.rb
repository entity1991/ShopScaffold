# == Schema Information
#
# Table name: users
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  encrypted_password :string(255)
#  salt               :string(255)
#  role               :string(255)     default("Customer")
#

class User < ActiveRecord::Base
  ROLES =  %w(Customer Filler Courier Admin)

  has_many :articles#, :dependent => :destroy
  has_one :cart, :dependent => :destroy
  attr_accessor :password #only virtual attribute(getter and setter)
  attr_accessible :name, :email, :password, :password_confirmation  #editable attribute

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,  :presence => true,
            :length           => { :maximum => 50 }
  validates :email, :presence => true,
            :format           => { :with => email_regex },
            :uniqueness       => true
  validates :password, :presence     => true,
            :confirmation => true,
            :length       => { :within => 6..40 }
  validates :role, inclusion: ROLES

  before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def admin?
    self.role == "Admin"
  end

  def boss?
    self.role == "Boss"
  end

  def customer?
    self.role == "Customer"
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
