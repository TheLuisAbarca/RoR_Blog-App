class UsersController < ApplicationController
  def index
    @users = User.order(:id)
  end

  def show
    @user = User.find(params[:id])
    # @posts = @user.posts.order(:id)
    # @posts = Post.where(author_id: params[:id]).order(:id)
    @posts = Post.where(author_id: @user.id).order(:id)
  end
end
