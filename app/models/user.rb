class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, inverse_of: 'author'
  has_many :likes, inverse_of: 'author'
  has_many :comments, inverse_of: 'author'

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_initialize :default_values

  def recent_3_posts
    posts.order(created_at: :desc).limit(3)
  end

  def default_values
    self.bio ||= 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
    self.photo ||= 'https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745'
  end
end
