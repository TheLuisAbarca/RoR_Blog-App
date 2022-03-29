class User < ApplicationRecord
  has_many :post, foreign_key: 'author_id'
  has_many :comment, foreign_key: 'author_id'
  has_many :like, foreign_key: 'author_id'

  def most_recent_posts
    Post.where(author_id: id).last(3)
  end

  def update_posts_counter
    self.postsCounter = Post.where(author_id: id).count
    save
  end
end
