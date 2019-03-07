class FeedbackController < ApplicationController

  def index
    @feedback = Feedback.all
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      flash[:success] = "Feedback sent. Thanks!"
      redirect_to request.referer
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:content)
  end
end
