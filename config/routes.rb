Rails.application.routes.draw do
  #friend_requests
  #resources :friend_requests
  post '/friend_requests/:id', to: "friend_requests#create", as: "friend_request"
  #users
  resources :users

  #profiles
  resources :profiles

  #friendships
  get '/friendships', to: 'friendships#index', as: 'friendships'
  get '/friendships/search', to: 'friendships#search', as: 'search'

  #sessions
  get '/sessions/new', to: 'sessions#new', as: 'new_session'
  post '/sessions/new', to: 'sessions#create', as: 'create_session'
  delete '/sessions/logout', to: 'sessions#destroy', as: 'logout'

  #homepage
  root 'sessions#new'

end
