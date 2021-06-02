Rails.application.routes.draw do

  # resources :newsletters do
  #   # make slots route through a newsletter
  #   resources :slots do
  #     # make bookings route through a slot
  #     resources :bookings
  #   end
  # end

  resources :newsletters do
    resources :slots
  end

  resources :slots do
    resources :bookings
  end

  # devise_for must sit above resources :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:show]
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
