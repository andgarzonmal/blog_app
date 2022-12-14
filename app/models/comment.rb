class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post

  after_save :update_comments_counter
  validates :text, presence: true

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end

  private :update_comments_counter
end
