class Post < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :commentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_blank: true
  validates :likesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_blank: true

  has_many :comments, dependent: :destroy
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
