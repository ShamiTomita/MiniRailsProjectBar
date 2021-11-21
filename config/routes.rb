Rails.application.routes.draw do
  root 'static#home'

  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/session/', to: 'session#destroy', as: 'logout'
    get '/cocktails/clear', to: 'cocktails#clear', as: 'clear'
  resources :cocktails
  resources :users
  resources :drinks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
