Rails.application.routes.draw do

  resources :posts_users
  resources :post_photos
  resources :follows
  resources :posts
  resources :users

  root "users#index"
end
