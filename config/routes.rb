Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  # As a user, I can see all my movie lists
  # As a user, I can create a movie list
  # As a user, I can see the details of a movie list
  # As a user, I can bookmark a movie inside a movie list
  # As a user, I can destroy a bookmark

  resources :lists, only: [ :new, :create, :index, :show ] do
    resources :bookmarks, only: [ :new, :create ]
  end
  resources :bookmarks, only: [ :destroy ]
end
