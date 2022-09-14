class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :comments
  has_many :likes

  def update_user_counter
    author.update!(posts_counter: Post.count)
  end

  def recent_5_comments
    comments.order(created_at: :desc).limit(5)
  end
end
