require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create(name: 'Tomas', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

  it 'name should be present' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'should not be valid if is less than 0' do
    user.posts_counter = 'nointeger'
    expect(user).not_to be_valid
  end

  it 'should return last 3 posts' do
    user1 = User.create(name: 'Tomas', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    Post.create(author: user1, title: 'Hello1', text: 'This is my post')
    Post.create(author: user1, title: 'Hello2', text: 'This is my post')
    Post.create(author: user1, title: 'Hello3', text: 'This is my post')
    Post.create(author: user1, title: 'Hello4', text: 'This is my post')
    expect(user1.recent_3_posts.length).to eq(3)
  end
end
