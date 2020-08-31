json.extract! post_photo, :id, :photo, :created_at, :updated_at
json.url post_photo_url(post_photo, format: :json)
