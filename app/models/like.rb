class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, foreign_key: 'posts_id'
  after_save :likes_counter

  def likes_counter
    post = Post.find(posts_id)
    post.increment!(:likesCounter)
  end
end
