Rails.application.routes.draw do
  resources :post_photos_users
  root to: "pages#welcome"

  #Session routes:
  get '/login' => 'session#new' # login form
  # form submits here, do auth & create sssion & redirect, or show form with errors
  post '/login' => 'session#create'
  delete '/login' =>'session#destroy' # logout, i.e. delete session for this users.
  resources :posts do
    resources :comments
  end

  resources :comments

  resources :post_photos

  resources :follows

  resources :posts

  #need custom destroy route because we arent relying on the like id.
  delete '/likes' => 'likes#destroy'
  resources :likes, except: [:destroy]

  delete '/dislikes' => 'dislikes#destroy'
  resources :dislikes, except: [:destroy]


  #Users CRUD:
  resources :users
  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
  resources :posts_users
end
