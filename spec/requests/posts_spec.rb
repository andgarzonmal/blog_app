require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    testuser = User.create(name: 'Andres', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher from Colombia.')
    before(:each) { get user_posts_path(testuser.id) }
    it 'response status is correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'correct template was rendered' do
      expect(response).to render_template 'posts/index'
    end

    it 'correct template was rendered testing without path' do
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder text.' do
      expect(response.body).to include('Andres')
    end

    describe 'GET /show' do
      testuser = User.create(name: 'Andres', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Teacher from Colombia.')
      testpost = Post.create(author: testuser, title: 'Hello', text: 'This is my 2 post')
      before(:each) { get user_post_path(testuser.id, testpost.id) }
      it 'response status is correct' do
        expect(response).to have_http_status(200)
      end

      it 'correct template show was rendered' do
        expect(response).to render_template(:show)
      end

      it 'response body includes correct placeholder text.' do
        expect(response.body).to include('by Andres')
      end
    end
  end
end

