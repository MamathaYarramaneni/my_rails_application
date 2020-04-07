class BlogPostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @blogs = BlogPost.all
  end

  def new
    unless current_user.admin?
      flash[:danger] = "You are not allowed to access this page."
      redirect_to root_path
    end
    @blogs = BlogPost.new
  end

  def show
    @blogs = BlogPost.where(id: params[:id])
    @comments = Comment.where(blog_post_id: params[:id])
    @users = User.all
    @blog = BlogPost.find_by_id(params[:id])
  end

  def update
    @blog = BlogPost.find_by_id(params[:id])
    if @blog.save
      redirect_to action: "show"
      return true
    else
      render "show"
    end
  end

  def create
    unless current_user.admin?
      flash[:danger] = "You are not allowed to access this page."
      redirect_to root_path
    end
    @blogs = BlogPost.new(blog_params)
    if @blogs.save
      redirect_to action: "index"
    else
      render "new"
    end
  end

  private

  def blog_params
    params[:blog_post].permit(:title, :content)
  end
end
