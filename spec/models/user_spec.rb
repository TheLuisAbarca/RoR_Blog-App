RSpec.describe User, type: :model do
    subject { User.new(name: 'Genie', postsCounter: 8) }
  
    before(:each) { subject.save }
  
    it 'name attribute should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  
    it 'postsCounter attribute should be an integer' do
      subject.postsCounter = 'abc'
      expect(subject).to_not be_valid
    end
  
    it 'postsCounter attribute should be greater than or equal to 0' do
      subject.postsCounter = -8
      expect(subject).to_not be_valid
    end
  
    context 'Most_recent_posts method' do
      it ' should return last three posts' do
        expect(subject.most_recent_posts.count).to be(0)
      end
    end
  end