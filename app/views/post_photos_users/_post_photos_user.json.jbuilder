json.extract! post_photos_user, :id, :user_id, :post_photo_id, :vote_photos, :created_at, :updated_at
json.url post_photos_user_url(post_photos_user, format: :json)
