class Post < ApplicationRecord
  # has_many :likes, dependent: :destroy
  #
  # has_many :dislikes, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :post, optional: true
  has_many :comments

  # has_and_belongs_to_many :liked_by_users, class_name:'User'
  # has_and_belongs_to_many :disliked_by_users, class_name:'User'


  def likes
    Like.where(target_id:self.id, target_type:'post')
  end

  def dislikes
    Dislike.where(target_id:self.id, target_type:'post')
  end

  def already_disliked_by?(user)
    Dislike.where(user:user, target_id:self.id, target_type:'post').any?
  end

  def already_liked_by?(user)
    Like.where(user:user, target_id:self.id, target_type:'post').any?
  end
end
