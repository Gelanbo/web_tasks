class Admin::CommentsController < ApplicationController

  def index
    @comment = Comment.where("pass = ?",false).paginate(:page => params[:page], :per_page => 5)
  end
  def pass
    @comment = Comment.find(params[:comment_id])
    @comment.pass = true
    @comment.save
    redirect_to '/admin/comment_index'
  end

  private
    def content_params
      params.require(:comment).permit(:content)
    end
end
