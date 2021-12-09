require 'bcrypt'

class User < ApplicationRecord
  attr_accessor :password

  before_save :hash_password
  before_create { generate_token(:auth_token) }
  before_create { generate_token(:access_token) }

  validates :password, :presence => { :on => :create }, :confirmation => true
  validates :username, :presence => true, :uniqueness => true
  validates :email, :uniqueness => true

  has_many :stories, class_name: 'Story', foreign_key: :author_id
  has_many :members
  has_many :memberships, :through => :members

  # Scope to find a user by either identifier
  def self.find_by_identifier(identifier)
    where("username = ? OR email = ?", identifier, identifier).first
  end

  # Check the supplied password against the stored hash
  def authenticate(password)
    hashed_password == BCrypt::Engine.hash_secret(password, salt)
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  # Resets the auth token so that it cannot be used by someone else after logout
  def refresh_auth_token
    generate_token(:auth_token)
    save!
  end

  def regenerate_access_token
    generate_token(:access_token)
    save!
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
