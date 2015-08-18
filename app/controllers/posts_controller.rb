class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(:id => params["id"])
  end

  def new

  end

  def create
  	Post.create title: params[:title],
             link: params[:link],
             note: params[:note],
             user_id: session[:user_id]

  	redirect_to root_path
  end

  def edit
    @post = Post.find_by(:id => params["id"])
  end

  def update
    @post = Post.find_by(:id => params["id"])
    @post.title = params["title"]
    @post.link = params["link"]
    @post.note = params["note"]
    @post.save
    redirect_to "/posts/#{@post.id}"
  end

  def destroy
    @post = Post.delete(params["id"])
    redirect_to root_path
  end

end
