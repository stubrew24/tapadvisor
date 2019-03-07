class TaproomsController < ApplicationController
  before_action :admin?, only: [:new, :create]

  def welcome
  end

  def index
    if current_user
      redirect_to home_path
    else
      @taprooms = Taproom.all
    end
  end

  def new
    @taproom = Taproom.new
  end

  def create
    @taproom = Taproom.new(taproom_params)
    if @taproom.save
      redirect_to taproom_path(@taproom)
    else
      render :new
    end
  end

  def show
    @taproom = Taproom.find(params[:id])
    @reviews = Review.where(taproom_id: @taproom.id)
  end

  def edit
    @taproom = Taproom.find(params[:id])
  end

  def update
    @taproom = Taproom.find(params[:id])
    @taproom.update(taproom_params)
    if @taproom.valid?
      redirect_to taproom_path(@taproom)
    else
      render :edit
    end
  end

  def search
    @taprooms = Taproom.where('brewery ilike ? OR location ilike ? OR bio ilike ?', "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%")
    render :index
  end

  def favourite
    Favourite.create(user_id: params[:user_id], taproom_id: params[:taproom_id])
    redirect_to taproom_path(params[:taproom_id])
  end

  def all
    @taprooms = Taproom.all
    render :index
  end

  private

  def taproom_params
    params.require(:taproom).permit(:brewery, :location, :opening_times, :bio, :query, :img_url)
  end

  def admin?
    redirect_to root_path unless current_user && current_user.admin
  end
end
