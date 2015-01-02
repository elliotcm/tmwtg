Rails.application.routes.draw do
  root to: 'home#index'

  resources :games do
    get 'players/:id', to: 'games#player', as: 'player'
    post 'join', to: 'games#join', as: 'join'
    post 'start', to: 'games#start', as: 'start'
  end

  resources :sessions, only: [:new, :create]
end
