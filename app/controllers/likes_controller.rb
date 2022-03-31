class LikesController < ApplicationController
  before_action :find_post, :find_user

  def create
    @like = @post.likes.new(author: @user)
    if @like.save
      redirect_to user_post_path(@user, @post), notice: 'Successfully added a Like!'
    else
      flash.now[:notice] = 'Failed to add Like.'
    end
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_user
    @user = current_user
  end
end
