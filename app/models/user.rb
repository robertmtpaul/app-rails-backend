class User < ApplicationRecord
  has_many :posts
  has_many :post_photos
  has_many :follows
  has_secure_password
  validates :name, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true
end
