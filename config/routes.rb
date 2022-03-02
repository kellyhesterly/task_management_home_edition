Rails.application.routes.draw do
  root 'application#home'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :categories
  resources :chores
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
