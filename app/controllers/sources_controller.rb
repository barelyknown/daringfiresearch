class SourcesController < ApplicationController

  def index
    @sources = Source.paginate(page: params[:page], per_page: 100).order("posts_count desc")
  end

  def show
    @source = Source.find(params[:id])
    @posts = @source.posts.order("published_on desc")
  end

end
