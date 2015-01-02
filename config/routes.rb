Rails.application.routes.draw do
  root to: 'home#index'

  resources :games do
    get 'players/:id', to: 'games#player', as: 'player'
  end

  resources :sessions, only: [:new, :create]
end
