require_relative '../rails_helper'

RSpec.describe Comment, type: :model do
  post = Post.create(title: 'Hello Developer', commentsCounter: 0)
  subject { Comment.new(text: 'Nice to meet you.', author_id: 1, post_id: post.id) }

  before(:each) { subject.save }

  context 'Testing post.increment! method that should' do
    it 'increments a posts comment counter' do
      post.increment!(:commentsCounter)
      expect(post.commentsCounter).to eql 1
    end
  end
end
