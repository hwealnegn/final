class UsersController < ApplicationController

  before_action :require_login, except: [:new, :create]

  def require_login
    @user = User.find_by(id: session[:user_id])
    if @user.blank?
      redirect_to root_url, notice: "Please login first."
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    if @user.save
      flash[:notice] = "Thanks for signing up!"
      redirect_to posts_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]

    if @user.password.present? && @user.password == params[:password_confirmation]
      if @user.save
        flash[:notice] = "Account updated successfully."
        redirect_to user_url(@user.id)
      else
        render 'edit'
      end
    else
      @user.errors.add(:password, "does not match")
      render 'edit'
    end
  end

  def favorite
    @user = User.find_by_id(session[:user_id])
    @posts = @user.favorited_posts
    @posts = @posts.page(params[:page]).per(10)
  end

  def post
    @user = User.find_by_id(session[:user_id])
    @posts = @user.posts
    @posts = @posts.page(params[:page]).per(10)
  end

end