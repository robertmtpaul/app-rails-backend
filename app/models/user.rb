require 'bcrypt'
class User < ApplicationRecord

  has_secure_password
  has_many :posts
  has_many :post_photos
  has_many :follows
  has_many :comments, :through => :posts
  # has_many :likes, dependent: :destroy
  # has_many :dislikes, dependent: :destroy
  validates :name, length: { minimum: 2, nmaximum: 20 }
  validates :email, presence: true, uniqueness: true
  private


  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow', dependent: :destroy

  has_many :following, through: :followed_users, source: 'followed'

  has_many :following_users,  class_name: 'Follow', foreign_key: :followed_id, dependent: :destroy
  
  has_many :followers, through: :following_users, source: 'follower'


  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end
