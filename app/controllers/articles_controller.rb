class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find_by(:id => params["id"])
  end

  def new

  end

  def create
  	Article.create title: params[:title],
  				   link: params[:link],
  				   comment: params[:comment]

  	redirect_to root_path
  end

end
