require 'rails_helper'

RSpec.describe 'UserShows', type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:each) do
    Comment.delete_all
    Like.delete_all
    Post.delete_all
    User.delete_all
    @user = User.create(name: 'Andres', photo: 'Photo-link', bio: 'Hello this is a test')
    6.times do |n|
      Post.create(author: @user, title: "Hello #{n}", text: 'This is my 1 post')
    end
    visit user_path(@user.id)
  end

  it 'Checks navigation from clicking link to post page' do
    post = @user.posts.last
    click_on('Post 1')
    expect(current_path).to eq "/users/#{@user.id}/posts/#{post.id}"
  end

  it 'can see the users profile picture' do
    expect(page.body).to include('Photo-link')
  end

  it 'I can see the user username.' do
    expect(page.body).to include('Andres')
  end

  it 'I can see the number of posts the user has written.' do
    expect(page.body).to include('Number of posts: 6')
  end

  it 'I can see the users bio.' do
    expect(page.body).to include('Hello this is a test')
  end

  it 'I can see the users first 3 posts.' do
    expect(page.body).to include('Post 1')
    expect(page.body).to include('Post 2')
    expect(page.body).to include('Post 3')
  end

  it 'I can see a button that lets me view all of a users posts and when clicked shows new path' do
    expect(page.body).to include('See all posts')
    click_on('See all posts')
    expect(current_path).to eq "/users/#{@user.id}/posts"
  end
end
