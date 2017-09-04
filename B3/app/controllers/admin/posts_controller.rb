class Admin::PostsController < ApplicationController

  def index
      @admin_id = Admin.find_by(adminname: session[:adminname]).id
      @posts = Post.where("admin_id = ? ",@admin_id).paginate(:page => params[:page], :per_page => 5)
  end

  def list
  end

  def create
    @admin_id = Admin.find_by(adminname: session[:adminname]).id
  end

  def show
    @post = Post.new(post_params)
    @post.admin_id = Admin.find_by(adminname: session[:adminname]).id
    @post.save
  end

  def show_post
    @post = Post.find(params[:post_id])
  end

  def edit
    @post = Post.find(params[:post_id])
    @post_id = @post.id
  end

  def update
    @post = Post.find(params[:post_id])
    @post.update(post_params)
    redirect_to '/admin/post_index'
  end

  def delete
    @post = Post.find(params[:post_id])
    @post.destroy
    redirect_to '/admin/post_index'
  end

  private
    def post_params
      params.require(:post).permit(:title,:content)
    end
end
