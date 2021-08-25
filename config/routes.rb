Rails.application.routes.draw do
  resources :newsletters, path: '/', only: %i[edit new update create destroy] do
    resources :slots
  end
  get '/:newsletter_id', to: 'slots#index', as: 'pretty_newsletter_slots'
  get '/:newsletter_id/embed', to: 'slots#embed', as: 'pretty_newsletter_slots_embed'
  get '/:newsletter_id/embed/:slot_type', to: 'slots#embed'

  # Route to toggle slot booked status
  resources :slots, only: %i[new create destroy] do
    patch :toggle_booking_status, on: :member
  end

  resources :slot_types, only: %i[edit new create update destroy]

  # devise_for must sit above resources :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:show]
  root to: 'home#index'
end
