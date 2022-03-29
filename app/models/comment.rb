class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'users_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'posts_id'
  after_save :comments_counter

  def comments_counter
    post = Post.find(posts_id)
    post.increment!(:commentsCounter)
  end
end
