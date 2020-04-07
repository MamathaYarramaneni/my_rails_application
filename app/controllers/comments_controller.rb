class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @idvalue = BlogPost.find_by(id: "#{params[:id]}").title
    @comments = Comment.new
    @user = current_user.try(:email)
    @blog_collection = BlogPost.all.collect { |p| [p.title, p.id] }
  end

  def create
    content = params[:content]
    userid = current_user.id
    blogid = params[:id]
    @comments = Comment.new(content: comment_params[:content], user_id: userid, blog_post_id: blogid)
    if @comments.save
      redirect_to controller: "blog_posts", action: "show"
    else
      render "new"
    end
  end

  private

  def comment_params
    params[:comment].permit(:content)
  end
end
