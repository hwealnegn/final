class PostsController < ApplicationController

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all
    end

    @posts = @posts.page(params[:page]).per(5)
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

  def favorite
    @user = User.find_by_id(session[:user_id])
    @post = Post.find_by(:id => params["id"])

    type = params[:type]
    if type == "favorite"
      @user.favorited_posts << (@post)
      redirect_to :back, notice: 'You favorited #{@post.title}'
    elsif type == "unfavorite"
      @user.favorited_posts.delete(@post)
      redirect_to :back, notice: 'You unfavorited #{@post.title}'
    else
      redirect_to :back
    end
  end

end
