class Story < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :user_id

  belongs_to :user
  has_many :users, :through => :members
  has_many :members
  has_many :pieces

  def ordered_pieces
    pieces.order(:created_at)
  end

  def formatted_text
    ordered_pieces.pluck(:text).join(" ")
  end

  def user_number_text
    all_users.count == 1 ? "#{all_users.count} User Collaborating" : "#{all_users.count} Users Collaborating"
  end

  def all_users
    [user, *users]
  end
end
