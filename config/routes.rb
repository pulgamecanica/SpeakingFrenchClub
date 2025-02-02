Rails.application.routes.draw do
  resources :phrases
  resources :event_cards
  resources :subscriptions
  resources :events
  resources :card_translations
  resources :cards
  resources :langs
  devise_for :users, skip: [:registrations]
  get 'intra_auth/ft_auth'
  get 'intra_auth/auth_callback'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "club_home#home"
end
