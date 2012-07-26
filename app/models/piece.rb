class Piece < ActiveRecord::Base
  validates_presence_of :text, :user_id, :story_id

	belongs_to :user
	belongs_to :story
end
