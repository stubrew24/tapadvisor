class ReviewsController < ApplicationController
  before_action :review_logged_in?, only: [:new, :create]

  def new
    @taproom = Taproom.find(params[:taproom_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @taproom = Taproom.find(params[:review][:taproom_id])
    if @review.save
      redirect_to taproom_path(@taproom)
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
    @taproom = Taproom.find(@review.taproom_id)
  end

  private

  def review_params
    params.require(:review).permit(:taproom_id, :rating, :comment, :visit_date, :user_id)
  end

  def review_logged_in?
    if !logged_in?
      store_location
      flash[:danger] = "You must be signed in to leave a review"
      redirect_to login_path
    end
  end
end
