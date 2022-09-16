require 'rails_helper'

RSpec.describe Post, type: :model do
  user1 = User.create(name: 'Tomas', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  post1 = Post.create(author: user1, title: 'Hello', text: 'This is my 1 post')
  Post.create(author: user1, title: 'Hello', text: 'This is my 2 post')

  it 'shoul start in 2' do
    expect(user1.posts_counter).to eq(2)
  end

  it 'should add one' do
    Post.create(author: user1, title: 'Hellodasd', text: 'This is my 2 post')
    expect(user1.posts_counter).to eq(3)
  end

  it 'title should be Hello' do
    expect(post1).to have_attributes(title: 'Hello')
  end

  it 'text should be This is my 1 post' do
    expect(post1).to have_attributes(text: 'This is my 1 post')
  end

  it 'should return last 5 comments' do
    6.times do |n|
      Comment.create(post: post1, author: user1, text: "Hi Tom #{n}!")
    end
    expect(post1.recent_5_comments.count).to eq(5)
  end
end
