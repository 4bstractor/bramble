class StoriesController < ApplicationController
  def index
    @stories = Story.all
  end

  def show
  	@story = Story.find(params[:id])
  end

  def new
  	@story = Story.new
  end

  def edit
  	@story = Story.find(params[:id])
  end

  def create
  	@story = Story.new(story_params)
  	current_user.stories << @story

    if @story.save
      redirect_to @story
    else
      render :new
    end
  end

  def update
  	@story = Story.find(params[:id])

    if @story.update_attributes(params[:story])
      redirect_to @story
    else
      render :edit
    end
  end

  def destroy
  	@story = Story.find(params[:id])
  	@story.destroy
  end

  private

  def story_params
    params.require(:story).permit(:title)
  end
end
