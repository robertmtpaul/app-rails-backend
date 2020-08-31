json.extract! post, :id, :user_post, :user_id, :likes, :dislike, :created_at, :updated_at
json.url post_url(post, format: :json)
