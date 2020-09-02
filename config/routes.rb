Rails.application.routes.draw do
<<<<<<< HEAD


  get 'comments/create'
  get 'comments/destroy'

=======
>>>>>>> 4d63ce4c09d855a17ed1090987421f007a1ddde7
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
  resources :posts_users
end
