json.extract! user, :id, :name, :password_digest, :profile_pic, :admin, :created_at, :updated_at
json.url user_url(user, format: :json)
