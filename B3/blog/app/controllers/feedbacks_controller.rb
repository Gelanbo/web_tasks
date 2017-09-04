class FeedbacksController < ApplicationController
  def result
    @feedback = Feedback.new(feedback_params)
    @feedback.author = "游客"
    @feedback.save
  end

  def index
    if session[:admin] == true
      @feedbacks = Feedback.all
    else
      redirect_to '/login'
    end
  end

  private
    def feedback_params
      params.require(:feedback).permit(:content)
    end
end
