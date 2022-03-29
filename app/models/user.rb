class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes, foreign_key: 'users_id'
  
  def most_recent_posts
    Post.where(users_id: id).last(3)
  end
  
  def update_posts_counter
    self.postsCounter = Post.where(users_id: id).count
    save
  end
end