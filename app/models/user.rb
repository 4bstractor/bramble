class User < ActiveRecord::Base
  # Include all default devise modules.
  devise :database_authenticatable, :registerable, :token_authenticatable, :confirmable, 
         :lockable, :timeoutable, :omniauthable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :stories
end
