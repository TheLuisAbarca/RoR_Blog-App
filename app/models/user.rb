class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  # validates :name, presence: true
  # validates :postsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id', dependent: :destroy

  def most_recent_posts
    Post.where(author_id: id).last(3)
  end

  def update_posts_counter
    self.postsCounter = Post.where(author_id: id).count
    save
  end
end
