class ReviewsController < ApplicationController

  def new
    @taproom = Taproom.find(params[:taproom_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @taproom = Taproom.find(params[:review][:taproom_id])
    if @review.save
      redirect_to review_path(@review)
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
end
