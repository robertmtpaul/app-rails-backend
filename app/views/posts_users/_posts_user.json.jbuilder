json.extract! posts_user, :id, :user_id, :post_id, :vote_post, :created_at, :updated_at
json.url posts_user_url(posts_user, format: :json)
