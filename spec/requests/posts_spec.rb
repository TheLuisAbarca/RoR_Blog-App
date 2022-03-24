require 'rails_helper'
require 'rails-controller-testing'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:example) { get '/users/:user_id/posts' }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Username: Comment 1')
    end
  end

  describe 'GET #show', type: :request do
    before(:example) { get '/users/:user_id/posts/:id' }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('show')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Post 1 by username')
    end
  end
end
