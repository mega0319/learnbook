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

  #friendships
  get '/friendships', to: 'friendships#index', as: 'friendships'
  get '/friendship', to: 'friendships#search', as: 'search'
  post '/friendships/:id', to: 'friendships#create', as: 'create_friendship'

  #sessions
  get '/sessions/new', to: 'sessions#new', as: 'new_session'
  post '/sessions/new', to: 'sessions#create', as: 'create_session'
  delete '/sessions/logout', to: 'sessions#destroy', as: 'logout'

  #homepage
  root 'sessions#new'

end
