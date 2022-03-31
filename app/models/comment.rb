class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'
  after_save :comments_counter

  def comments_counter
    post = Post.find(post_id)
    post.increment!(:commentsCounter)
  end

  def find_author
    User.find(author_id).name
  end
end
