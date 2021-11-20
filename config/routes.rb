Rails.application.routes.draw do
  root 'static#home'
  get '/users/new', to: 'users#new', as: 'new_user'
  get '/signin', to: 'session#new', as: 'signin'
  post '/session', to: 'session#create', as: 'session'
  delete '/session/', to: 'session#destroy'
    get '/cocktails/clear', to: 'cocktails#clear', as: 'clear'
  resources :cocktails
  resources :users
  resources :drinks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
