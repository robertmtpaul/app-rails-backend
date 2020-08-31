class PostsUser < ApplicationRecord
  enum vote_posts: [:likes, :dislike]
end
