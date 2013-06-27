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

  def all_users
    [user, *users]
  end
end
