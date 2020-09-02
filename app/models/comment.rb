class Comment < ApplicationRecord
    belongs_to :post, optional:true
    has_many :likes
end
