class Comment < ApplicationRecord
    belongs_to :post, optional:true
    belongs_to :user
    belongs_to :post_photo, optional:true
    # has_many :likes
    # has_many :dislikes


    def likes
      Like.where(target_id:self.id, target_type:'comment')
    end

    def dislikes
      Dislike.where(target_id:self.id, target_type:'comment')
    end

    def already_disliked_by?(user)
      Dislike.where(user:user, target_id:self.id, target_type:'comment').any?
    end

    def already_liked_by?(user)
      Like.where(user:user, target_id:self.id, target_type:'comment').any?
    end
end
