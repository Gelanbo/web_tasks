class CommentsController < ApplicationController
  skip_before_action :require_login,only: [:create,:creates]

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

  private
    def content_params
      params.require(:comment).permit(:content)
    end
end
