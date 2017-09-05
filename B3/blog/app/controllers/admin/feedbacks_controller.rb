class Admin::FeedbacksController < ApplicationController

  def index
    @feedbacks = Feedback.paginate(:page => params[:page], :per_page => 5)
  end

  private
    def feedback_params
      params.require(:feedback).permit(:content)
    end
end
