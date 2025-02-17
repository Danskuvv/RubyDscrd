Rails.application.routes.draw do
  get "conversations/index"
  get "conversations/show"
  get "conversations/create"
  get "friendships/create"
  get "friendships/update"
  get "friendships/destroy"
  get "friendships/index"
  devise_for :users
  get "home/index"
  # resources :users 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Add friend requests routes:
  resources :friendships, only: [:create, :update, :destroy, :index]

  # Add conversations routes:
  resources :conversations, only: [:index, :show, :create] do
    resources :messages, only: [:create]
  end

  # Message refreshing fallback route if turbo or actioncable are not working
  resources :conversations, only: [:show] do
    get 'messages', on: :member
  end
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "home#index"
  
end
