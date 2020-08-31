class PostPhotosUser < ApplicationRecord
  enum vote_photos: [:likes, :dislike]
end
