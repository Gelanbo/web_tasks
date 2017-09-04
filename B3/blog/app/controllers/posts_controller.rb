class PostsController < ApplicationController
  def index
    if session[:admin] == true
      @posts = Post.all
      @admin_id = Admin.find(1).id
    else
      redirect_to '/login'
    end
  end
  def list
    if session[:admin] == false
      redirect_to '/login'
    end
  end

  def create
    if session[:admin] == true
      @admin_id = Admin.find(1).id
    else
      redirect_to '/login'
    end
  end

  def show
    if session[:admin] == true
      @post = Post.new(post_params)
      @post.admin_id = Admin.find(1).id
      @post.save
    else
      redirect_to '/login'
    end
  end

  def show_post
    if session[:admin] == true
      @post = Post.find(params[:post_id])
    else
      redirect_to '/login'
    end
  end

  def shows_post
    @post = Post.find(params[:post_id])
    @post_id = @post.id
    @comments = @post.comments
  end

  def months_shows
    @posts = Post.where(updated_at: (Time.now - 30.day)..Time.now)
    @posts_year = Post.where(updated_at: (Time.now - 365.day)..Time.now)
    @posts_early = Post.where("updated_at <= :end_date ")
      {end_date: Time.now - 365.day}
    @admin_id = Admin.find(1).id
  end

  def edit
    if session[:admin] == true
      @post = Post.find(params[:post_id])
      @post_id = @post.id
    else
      redirect_to '/login'
    end
  end

  def update
    if session[:admin] == true
      @post = Post.find(params[:post_id])
      @post.update(post_params)
      redirect_to '/post_index'
    else
      redirect_to '/login'
    end
  end

  def delete
    if session[:admin] == true
      @post = Post.find(params[:post_id])
      @post.destroy
      redirect_to '/post_index'
    else
      redirect_to '/login'
    end
  end

  def index_front
    @posts = Post.all
    @admin_id = Admin.find(1).id
  end

  def search
    @admin_id = Admin.find(1).id
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
