require 'rails_helper'

RSpec.describe Comment, type: :model do
  user2 = User.create(name: 'Tomas', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  post2 = Post.create(author: user2, title: 'Hello', text: 'This is my 1 post')
  comment = Comment.create(post: post2, author: user2, text: 'Hi Tomas!')
  Comment.create(post: post2, author: user2, text: 'Hi Tomas ke!')

  it 'shoul start in 2' do
    expect(post2.comments_counter).to eq(2)
  end

  it 'should add one' do
    Comment.create(post: post2, author: user2, text: 'Hi Tomas ke!')
    expect(post2.comments_counter).to eq(3)
  end

  it 'text should be Hi Tomas!' do
    expect(comment).to have_attributes(text: 'Hi Tomas!')
  end
end
