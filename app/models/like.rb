class Like < ApplicationRecord
  belongs_to :post, optional:true
  belongs_to :user
  belongs_to :comment, optional:true
  belongs_to :post_photo, optional:true
  enum target_type: [:post,:post_photo,:comment]
end
