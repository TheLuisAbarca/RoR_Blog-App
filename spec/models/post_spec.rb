require_relative '../rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'John Snow', postsCounter: 0)
  subject { Post.new(title: 'Winter is Comming', text: 'Beware', author_id: 1, commentsCounter: 3, likesCounter: 8) }

  before(:each) { subject.save }

  it 'title attribute must be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title attribute must not exceed 250 characters' do
    subject.title = 'z' * 251
    expect(subject).to_not be_valid
  end

  it 'commentCounter attribute is an integer' do
    subject.commentsCounter = 'aeiou'
    expect(subject).to_not be_valid
  end

  it 'commentCounter attribute is greater than or equal to 0' do
    expect(subject.commentsCounter).to eql 3
  end

  it 'likesCounter attribute is an integer' do
    expect(subject.likesCounter).to eql 8
  end

  it 'likesCounter attribute is greater than or equal to 0' do
    expect(subject.likesCounter).to eql 8
  end

  context 'most_recent_comments method' do
    it ' should return recent comments' do
      expect(subject.most_recent_comments.count).to be(0)
    end
  end

  context 'user.increment! method that should' do
    it 'increments user posts counter' do
      user.increment!(:postsCounter)
      expect(user.postsCounter).to eql 1
    end
  end
end