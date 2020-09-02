class User < ApplicationRecord
<<<<<<< HEAD

=======
  has_many :comments
>>>>>>> 4d63ce4c09d855a17ed1090987421f007a1ddde7
  has_many :posts
  has_many :post_photos
  has_many :follows
  # has_many :likes, dependent: :destroy
  # has_many :dislikes, dependent: :destroy
  has_secure_password
  validates :name, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true

  has_many :comments

  has_many :following_relationships, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy
  has_many :followed_relationships,  class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy

  has_many :following, through: 'following_relationships', source: 'followed'
  has_many :followers, through: 'followed_relationships', source: 'follower'

end
