class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy
  belongs_to :user, optional: true
  # has_and_belongs_to_many :liked_by_users, class_name:'User'
  # has_and_belongs_to_many :disliked_by_users, class_name:'User'
end
