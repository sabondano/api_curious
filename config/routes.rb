Rails.application.routes.draw do
  get '/auth/twitter', as: 'login'
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/dashboard', to: 'dashboard#show'
  root 'welcome#show'
  post '/tweet', to: 'tweets#tweet'
  post '/favorite', to: 'tweets#favorite'
  post '/retweet', to: 'tweets#retweet'
  post '/reply', to: 'tweets#reply'
end
