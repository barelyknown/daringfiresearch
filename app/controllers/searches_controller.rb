class SearchesController < ApplicationController


  def new
    @search = Search.new
    render layout: 'search'
  end
  
  def create
    @search = Search.new(params[:search])
    if @search.save
      redirect_to @search
    else
      redirect_to new_search_path
    end    
  end
  alias_method :update, :create
  
  def show
    unless @search = Search.find_by_param(params[:id]).last
      @search = Search.create(query: CGI.unescape(params[:id]))
    end
  end

end
