class FeedbacksController < ApplicationController
<<<<<<< 7543c925bb722c641a63a2acefc51aaa92593073
=======
  skip_before_action :require_login,only: [:result]

>>>>>>> b3
  def result
    @feedback = Feedback.new(feedback_params)
    @feedback.author = "游客"
    @feedback.save
  end

<<<<<<< 7543c925bb722c641a63a2acefc51aaa92593073
  def index
    if session[:admin] == true
      @feedbacks = Feedback.all
    else
      redirect_to '/login'
    end
  end

=======
>>>>>>> b3
  private
    def feedback_params
      params.require(:feedback).permit(:content)
    end
end
