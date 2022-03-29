class Post < ApplicationRecord
  has_many :comment
  has_many :like
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  after_save :update_counter

  def update_counter
    user = User.find(author_id)
    user.increment!(:postsCounter)
  end

  def most_recent_comments
    Comment.where(posts_id: id).last(5)
  end
end
