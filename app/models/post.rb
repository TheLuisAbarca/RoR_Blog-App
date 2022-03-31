class Post < ApplicationRecord
  has_many :comments
  has_many :likes, dependent: :destroy
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  after_save :update_counter

  def update_counter
    user = User.find(author_id)
    user.increment!(:postsCounter)
  end

  def update_comments_counter
    self.commentsCounter = Comment.where(post_id: id).count
    save
  end

  def update_likes_counter
    self.likesCounter = Like.where(post_id: id).count
    save
  end

  def most_recent_comments
    Comment.where(post_id: id).last(5)
  end
end
