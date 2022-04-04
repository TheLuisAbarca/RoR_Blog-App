require_relative '../rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'John Snow')
  post = Post.create(id: 1, title: 'Winter is Comming', likesCounter: 0)
  subject { Like.new(author_id: user.id, post_id: post.id) }

  before(:each) { subject.save }

  context 'post.increment! method that should' do
    it 'updates likes counter' do
      post.increment!(:likesCounter)
      expect(post.likesCounter).to eql 1
    end
  end
end
