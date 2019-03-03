class TaproomsController < ApplicationController

  def welcome
  end

  def index
    @taprooms = Taproom.all
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
    @taprooms = Taproom.where('brewery LIKE ?', "%#{params[:query]}%")
    render :index
  end

  private

  def taproom_params
    params.require(:taproom).permit(:brewery, :location, :opening_times, :bio, :query)
  end

end
