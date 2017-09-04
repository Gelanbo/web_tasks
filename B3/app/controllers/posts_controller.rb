class PostsController < ApplicationController
  skip_before_action :require_login,only: [:index_front,:shows_post,:months_shows,:search,:show_search]

  def shows_post
    @post = Post.find(params[:post_id])
    @post_id = @post.id
    @comments = @post.comments
  end

  def months_shows
    @posts = Post.where(updated_at: (Time.now - 30.day)..Time.now).paginate(:page => params[:page], :per_page => 5)
    @posts_year = Post.where(updated_at: (Time.now - 365.day)..Time.now)
    @posts_early = Post.where("updated_at <= :end_date ")
      {end_date: Time.now - 365.day}
    @admin_id = 0
  end

  def index_front
    @posts = Post.paginate(:page => params[:page], :per_page => 5)
    if session[:adminname] != 'visitor'
      @admin_id = Admin.find_by(adminname: session[:adminname]).id
    else
      @admin_id = 0
    end
  end

  def search
    if session[:adminname] != 'visitor'
      @admin_id = Admin.find_by(adminname: session[:adminname]).id
    else
      @admin_id = 0
    end
    @posts = Post.where(post_params)
  end

  def show_search
    @post = Post.find(params[:post_id])
  end

  private
    def post_params
      params.require(:post).permit(:title,:content)
    end
end
