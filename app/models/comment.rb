class Comment < ApplicationRecord
    belongs_to :post, optional:true
    belongs_to :user
    has_many :likes
end
