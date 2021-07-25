Rails.application.routes.draw do

  resources :newsletters, path: '/', only: %i[edit new update create destroy] do
    resources :slots
  end

  # Custom / Non-standard routes
  get '/:newsletter_id', to: 'slots#index', as: 'pretty_newsletter_slots'

  # Route to toggle slot booked status
  resources :slots do
    patch :toggle_booking_status, on: :member
  end


  # devise_for must sit above resources :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:show]
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
