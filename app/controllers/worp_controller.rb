class WorpController < ApplicationController
  def index
    @user_num = User.all.count
    @story_num = Story.all.count
  end
end
