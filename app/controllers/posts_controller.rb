class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user.id)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.author_id)
    @comments = Comment.where(post_id: @post.id)
    @comment = Comment.all.where("post_id = #{params[:id]}, user_id = #{params[:user_id]}")
  end

  def create
    @user = User.find(params[:user_id])

    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to user_path(@user), notice: 'Successfully added a Post!'
    else
      flash.now[:notice] = 'Failed to create a Post.'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
