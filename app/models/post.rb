class Post < ApplicationRecord
    has_many :comments
    has_many :likes
    belongs_to :user, class_name: 'User', foreign_key: 'users_id'
    after_save :update_counter
  
    def update_counter
      user = User.find(users_id)
      user.increment!(:postsCounter)
    end

    def most_recent_comments
      Comment.where(posts_id: id).last(5)
    end
  end