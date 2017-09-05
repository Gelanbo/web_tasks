class FeedbacksController < ApplicationController
  skip_before_action :require_login,only: [:result]

  def result
    @feedback = Feedback.new(feedback_params)
    @feedback.author = "游客"
    @feedback.save
  end

  private
    def feedback_params
      params.require(:feedback).permit(:content)
    end
end
