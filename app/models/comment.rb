class Comment < ApplicationRecord
<<<<<<< HEAD
    belongs_to :post, optional:true
    belongs_to :user
    belongs_to :post_photo, optional:true
    # has_many :likes
    # has_many :dislikes


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
=======
    belongs_to :post, optional: true
    belongs_to :users, optional: true
    has_many :likes
>>>>>>> 4d63ce4c09d855a17ed1090987421f007a1ddde7
end
