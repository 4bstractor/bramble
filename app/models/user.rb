require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :email, :username, :quote, :salt, :password, :password_confirmation

  attr_accessor :password

  before_save :hash_password
  before_create { generate_token(:auth_token) }

  validates :password, :presence => { :on => :create }, :confirmation => true
  validates :username, :presence => true, :uniqueness => true
  validates :email, :uniqueness => true

  has_many :stories
  has_many :members
  has_many :member_of_stories, :through => :members, :source => :story

  # Scope to find a user by either identifier
  def self.find_by_identifier(identifier)
    where("username = ? OR email = ?", identifier, identifier).first
  end

  # Check the supplied password against the stored hash
  def authenticate(password)
    hashed_password == BCrypt::Engine.hash_secret(password, salt)
  end

  private

  # Generate a unique random token for 'column' field
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  # Hash the users password and generate a salt on creation
  def hash_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.hashed_password = BCrypt::Engine.hash_secret(password, self.salt)
    end
  end
end
