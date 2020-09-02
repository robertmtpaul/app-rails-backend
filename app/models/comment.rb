class Comment < ApplicationRecord
    belongs_to :post, optional: true
    belongs_to :users, optional: true
    has_many :likes
end
