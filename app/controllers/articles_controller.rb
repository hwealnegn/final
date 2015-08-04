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

  def edit
    @article = Article.find_by(:id => params["id"])
  end

  def update
    @article = Article.find_by(:id => params["id"])
    @article.title = params["title"]
    @article.link = params["link"]
    @article.comment = params["comment"]
    @article.save
    redirect_to "/articles/#{@article.id}"
  end

  def destroy
    @article = Article.delete(params["id"])
    redirect_to root_path
  end

end
