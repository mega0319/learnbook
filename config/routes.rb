Rails.application.routes.draw do
  #friend_requests
  #resources :friend_requests
  get '/friend_requests/:id', to: "friend_requests#show", as: "friend_request_page"
  post '/friend_requests/:id', to: "friend_requests#create", as: "friend_request"
  delete '/friend_requests/:id', to: "friend_requests#destroy", as: "destroy_request"
  #users
  resources :users

  #messages
  get '/messages', to: "messages#index", as: "messages"

  #profiles
  resources :profiles

  #likes
  post '/likes', to: "likes#create", as: "gen_like"

  #dislikes
  post '/dislikes', to: "dislikes#create", as: "gen_dislike"

  #posts
  get '/posts', to: "posts#index", as: "posts"
  get '/posts/new', to: "posts#new", as: "new_post"
  post '/posts', to: "posts#create"
  get '/posts/:id', to: "posts#show", as: "post"
  get'/posts/:id/edit', to: "posts#edit", as: "edit_post"
  patch '/posts/:id', to: "posts#update", as: "update_post"

  delete '/posts/:id', to: "posts#destroy", as: "delete_post"

  #messages
  resources :received_messages
  resources :sent_messages
  resources :messages

  #friendships
  get '/show/friendships', to: 'friendships#show', as: 'show_friends'
  get '/friendships', to: 'friendships#index', as: 'friendships'
  get '/friendships/search', to: 'friendships#search', as: 'search'
  post '/friendships/create', to: 'friendships#create', as: 'create_friendship'
  delete '/friendships', to: 'friendships#destroy', as: 'delete_me'

  #sessions
  get '/sessions/new', to: 'sessions#new', as: 'new_session'
  post '/sessions/new', to: 'sessions#create', as: 'create_session'
  delete '/sessions/logout', to: 'sessions#destroy', as: 'logout'

  #homepage
  root 'sessions#new'

end
