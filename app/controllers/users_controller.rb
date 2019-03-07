class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :new_user, only: [:new, :create]
  before_action :admin? , only: [:manage]

  def index
    @taprooms = Taproom.all
    @posts = current_user.posts.where(published: true).order('id DESC')
  end

  def show
    @user = User.find(params[:id])
    @reviews = Review.where(user_id: @user.id)
    @favourites = Favourite.where(user_id: @user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to TapAdvisor"
      redirect_back_or @user
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "#{@user.name.split(" ").first}'s profile updated."
      if current_user.admin
        redirect_to users_path
      else
        redirect_to user_path(@user)
      end
    else
      render :edit
    end
  end

  def manage
    @users = User.order('name ASC').all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin, :taproom_id)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please sign in"
      redirect_to login_path
    end
  end

  def new_user
    if logged_in?
      redirect_to current_user
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless (current_user?(@user) || current_user.admin)
  end

  def admin?
    if !(current_user && current_user.admin)
      redirect_to home_path
    end
  end
end
