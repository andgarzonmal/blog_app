require 'rails_helper'

RSpec.describe 'Post Show', type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:each) do
    Comment.delete_all
    Like.delete_all
    Post.delete_all
    User.delete_all
    @user = User.create(name: 'Andres', photo: 'Photo-link', bio: 'Hello this is a test')
    @mypost = Post.create(author: @user, title: 'Hello', text: 'This is my 1 post')
    @mycomment = Comment.create(post: @mypost, author: @user, text: 'Hi Tomas!')
    visit user_post_path(@user.id, @mypost.id)

    it 'I can see the posts title.' do
      expect(page.body).to include('Hello')
    end

    it 'I can see who wrote the post.' do
      expect(page.body).to include('Hello by Andres')
    end

    it 'I can see how many comments it has.' do
      expect(page.body).to include('Comments 1')
    end

    it 'I can see how many comments it has.' do
      expect(page.body).to include('Likes 0')
    end

    it 'I can see some of the posts body.' do
      expect(page.body).to include('This is my 1 post')
    end

    it 'I can see some the username of each commentor.' do
      expect(page.body).to include('Andres:')
    end

    it 'I can see some the comment each commentor left.' do
      expect(page.body).to include('Andres: Hi Tomas!')
    end
  end
end
