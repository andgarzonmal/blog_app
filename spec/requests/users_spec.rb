require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'response status is correct' do
      get users_path
      expect(response).to have_http_status(200)
    end
    it 'correct template was rendered' do
      get users_path
      expect(response).to render_template(:index)
    end
    it 'response body includes correct placeholder text.' do
      get users_path
      expect(response.body).to include('Tom')
    end
  end

  describe 'GET /show' do
    testuser = User.create(name: 'Andres', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher from Colombia.')
    before(:each) { get user_path(testuser.id) }

    it 'response status is correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'correct template was rendered' do
      expect(response).to render_template(:show)
    end

    it 'response body includes correct placeholder text.' do
      expect(response.body).to include('Andres')
    end
  end
end
