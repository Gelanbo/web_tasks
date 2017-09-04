class CommentsController < ApplicationController
<<<<<<< 7543c925bb722c641a63a2acefc51aaa92593073
  def index
    if session[:admin] == true
      @comment = Comment.all
    else
      redirect_to '/login'
    end
  end
=======
  skip_before_action :require_login,only: [:create,:creates]

>>>>>>> b3
  def create
    @post = Post.find(params[:post_id])
    @post_id = @post.id
  end

  def creates
    @comment = Comment.new(content_params)
    @comment.post_id = params[:post_id]
    @comment.pass = false
    @comment.save
    redirect_to "/post_shows/#{Admin.find(1).id}/#{@comment.post_id}"
  end
<<<<<<< 7543c925bb722c641a63a2acefc51aaa92593073
  def pass
    if session[:admin] == true
      @comment = Comment.find(params[:comment_id])
      @comment.pass = true
      @comment.save
      redirect_to '/comment_index'
    else
      redirect_to '/login'
    end
  end
=======
>>>>>>> b3

  private
    def content_params
      params.require(:comment).permit(:content)
    end
end
