class PostPhoto < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :user, optional: true
  # has_many :likes, dependent: :destroy
  # has_many :dislikes, dependent: :destroy
  has_many :comments
  validates_presence_of :photo

  def likes
    Like.where(target_id:self.id, target_type:'post_photo')
  end

  def dislikes
    Dislike.where(target_id:self.id, target_type:'post_photo')
  end

  def already_disliked_by?(user)
    Dislike.where(user:user, target_id:self.id, target_type:'post_photo').any?
  end

  def already_liked_by?(user)
    Like.where(user:user, target_id:self.id, target_type:'post_photo').any?
  end

end
