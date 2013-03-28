require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :email, :username, :quote, :salt, :password, :password_confirmation

  attr_accessor :password

  before_save :hash_password

  validates_confirmation_of :password
  validates :password, :presence => { :on => :create }, :confirmation => true
  validates :username, :presence => true, :uniqueness => true
  validates :email, :uniqueness => true

  has_many :stories

  # Scope to find a user by either identifier
  def self.find_by_identifier(identifier)
    where("username = ? OR email = ?", identifier, identifier).first
  end

  def authenticate(password)
    hashed_password == BCrypt::Engine.hash_secret(password, salt)
  end

  private

  def hash_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.hashed_password = BCrypt::Engine.hash_secret(password, self.salt)
    end
  end
end
