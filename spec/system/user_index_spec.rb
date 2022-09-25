require 'rails_helper'

RSpec.describe 'User Index', type: :system do
  before do
    driven_by(:rack_test)
  end
  before(:each) do
    Comment.delete_all
    Like.delete_all
    Post.delete_all
    User.delete_all
    @usera = User.create(name: 'Andres', photo: 'Photo-link', bio: 'Hello this is a test')
    6.times do |n|
      Post.create(author: @usera, title: "Hello #{n}", text: 'This is my 1 post')
    end
    visit root_path
  end

  it 'shows the username on the screen' do
    expect(page).to have_content(@usera.name)
  end

  it 'shows the user photo' do
    expect(page.body).to include('Photo-link')
  end

  it 'shows number of posts user has written' do
    expect(page.body).to include('Number of posts: 6')
  end

  it 'Checks navigation from clicking link to user profile' do
    user = User.first
    visit '/users'
    click_on(user.name)
    expect(current_path).to eq "/users/#{user.id}"
  end
end
