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
             comment: params[:comment],
             type: params[:type],
             user_id: params[:user_id]

  	redirect_to root_path
  end

  def edit
    @post = Post.find_by(:id => params["id"])
  end

  def update
    @post = Post.find_by(:id => params["id"])
    @post.comment = params["comment"]
    @post.type = params["type"]
    @post.user_id = params["user_id"]
    @post.save
    redirect_to "/posts/#{@post.id}"
  end

  def destroy
    @post = Post.delete(params["id"])
    redirect_to root_path
  end

end
