require 'rails_helper'

RSpec.describe Post, type: :model do
  user1 = User.create(name: 'Tomas', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  post1 = Post.create(author: user1, title: 'Hello', text: 'This is my 1 post')
  Like.create(author: user1, post: post1)

  it 'shoul start in 2' do
    expect(post1.likes_counter).to eq(1)
  end

  it 'should add one' do
    Like.create(author: user1, post: post1)
    expect(post1.likes_counter).to eq(2)
  end
end
