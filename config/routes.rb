Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :posts
  resources :profiles
  resources :comments
  resources :likes
  resources :follows
  root "posts#index"
  # Custom route to show the current user's profile
  get 'my_profile', to: 'profiles#show', as: 'my_profile'
  get 'edit_my_profile', to: 'profiles#edit', as: 'edit_my_profile'
  # Defines the root path route ("/")
  # root "posts#index"
end
