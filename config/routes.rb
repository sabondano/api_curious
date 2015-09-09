Rails.application.routes.draw do
  get '/auth/twitter', as: 'login'
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/dashboard', to: 'dashboard#show'
  root 'welcome#show'
end
