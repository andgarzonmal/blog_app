require 'rails_helper'

RSpec.describe "PostIndices", type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:each) do
    Comment.delete_all
    Like.delete_all
    Post.delete_all
    User.delete_all
    @user = User.create(name: 'Andres', photo: 'Photo-link', bio: 'Hello this is a test')
    @mypost = Post.create(author: @user, title: "Hello", text: 'This is my 1 post')
    @mycomment = Comment.create(post: @mypost, author: @user, text: 'Hi Tomas!')
    visit user_posts_path(@user.id)
  end

  it 'can see the users profile picture' do
    expect(page.body).to include('Photo-link')
  end

  it 'I can see the user username.' do
    expect(page.body).to include('Andres')
  end

  it 'I can see the number of posts the user has written.' do
    expect(page.body).to include('Number of posts: 1')
  end
  
  it 'I can see post title.' do
    expect(page.body).to include('Post 1')
  end
  
  it'I can see some of the posts body.' do 
    expect(page.body).to include('This is my 1 post')
  end

  it 'I can see the first comments on a post.' do 
    expect(page.body).to include('Hi Tomas!')
  end

  it 'I can see how many comments the post has.' do 
    expect(page.body).to include('Comments: 1')
  end
  
  it 'I can see how many likes a post has.' do 
    expect(page.body).to include('Likes: 0')
  end

  it 'I can see a section for pagination' do 
    expect(page.body).to include('pagination')
  end

  it 'When I click on a post, it redirects me to that posts show page.' do 
    click_on('Post 1')
    expect(current_path).to eq "/users/#{@user.id}/posts/#{@mypost.id}"
  end
end
