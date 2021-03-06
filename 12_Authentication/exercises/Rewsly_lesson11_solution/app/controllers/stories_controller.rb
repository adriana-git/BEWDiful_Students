class StoriesController < ApplicationController
  def index
    #Uses the method that is defined in models/story.rb (self.Search)

    @stories = Story.search_for params[:q]
  end

  def search
    #Uses the method that is defined in models/story.rb (self.Search)

    @stories = Story.search_for params[:q]
    render :index
  end

  def show
    @story = Story.find params[:id]
  end

  def new
    @story = Story.new
  end

  def create
    safe_story_params = params.require(:story).permit(:title, :link, :category)
    @story = Story.new safe_story_params
    @story.upvotes = 1
    if @story.save
      #@story path
      redirect_to @story
    else
      render :new
    end
  end
end
