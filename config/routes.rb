Rails.application.routes.draw do
  root 'application#home'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/:users/:id/:chores', to: 'chores#index'


  resources :categories
  resources :chores
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
