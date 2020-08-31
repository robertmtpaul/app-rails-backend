Rails.application.routes.draw do

  root to: "pages#welcome"

  #Session routes: 
  get '/login' => 'session#new' # login form
  # form submits here, do auth & create sssion & redirect, or show form with errors
  post '/login' => 'session#create'
  delete '/login' =>'session#destroy' # logout, i.e. delete session for this users.
  
  resources :post_photos
  resources :follows
  resources :posts
  #Users CRUD:
  resources :users
end
