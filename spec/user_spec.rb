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
    4.times do |n|
      Post.create(author: user, title: "Hello#{n}", text: "This is my #{n} post")
    end
    expect(user.recent_3_posts.count).to eq(3)
  end
end
