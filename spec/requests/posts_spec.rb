require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) { get user_posts_path(1) }
    it 'response status is correct' do
      expect(response).to have_http_status(:ok)
    end
    
    it 'correct template was rendered' do
      expect(response).to render_template "posts/index"
    end

    it 'correct template was rendered testing without path' do
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder text.' do
      expect(response.body).to include('posts index here')
    end

    describe 'GET /show' do

      before(:each) { get user_post_path(1, 3) }
      it 'response status is correct' do
        expect(response).to have_http_status(200)
      end
    
      it 'correct template show was rendered' do
        expect(response).to render_template(:show)
      end

      it 'response body includes correct placeholder text.' do
        expect(response.body).to include('posts show here')
      end
    end
  end
end
