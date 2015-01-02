Rails.application.routes.draw do
  root to: 'home#index'

  resources :games do
    get 'hand', to: 'games#hand', as: 'hand'
    post 'join', to: 'games#join', as: 'join'
    post 'start', to: 'games#start', as: 'start'
    post 'send-to', to: 'games#send_to', as: 'send_to'
    post 'save-letters', to: 'games#save_letters', as: 'save_letters'
  end

  resources :sessions, only: [:new, :create]
end
