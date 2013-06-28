class Api::V1::StoriesController < ApplicationController
  respond_to :json
  
  def index
    @stories = current_user.stories
  end
end
