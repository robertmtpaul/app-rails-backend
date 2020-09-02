class User < ApplicationRecord
  has_secure_password

  has_many :posts
  has_many :post_photos
  has_many :follows
  # has_many :likes, dependent: :destroy
  # has_many :dislikes, dependent: :destroy
  validates :name, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true

  has_many :comments

  has_many :following_relationships, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy
  has_many :followed_relationships,  class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy

  has_many :following, through: 'following_relationships', source: 'followed'
  has_many :followers, through: 'followed_relationships', source: 'follower'

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end
