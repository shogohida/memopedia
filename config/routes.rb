Rails.application.routes.draw do
  # get 'events/index'
  # get 'events/show'
  # get 'events/new'
  devise_for :users
  root to: 'pages#home'

  resources :events, only: [:index, :show, :new, :create]
end
