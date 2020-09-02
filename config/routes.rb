Rails.application.routes.draw do
  resources :post_photos_users
  root to: "pages#home"

  #Session routes:
  get '/login' => 'session#new' # login form
  # form submits here, do auth & create sssion & redirect, or show form with errors
  post '/login' => 'session#create'
  delete '/login' =>'session#destroy' # logout, i.e. delete session for this users.
  resources :posts do
    resources :comments
  end
  resources :post_photos
  resources :follows
  resources :posts do
    resources :likes
    resources :dislikes
  end
  #Users CRUD:
  resources :users
  resources :posts_users
end
