class CommentsController < ApplicationController
  before_action :find_post

  def new
    @comment = Comment.new
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.author_id = @user.id

    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Successfully added a Comment!'
    else
      flash.now[:notice] = 'Comment could not be created'
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
