Rails.application.routes.draw do
  root to: "dashboard#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks'
    # omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # Admin can manage all users
  resources :users, only: [:index, :show, :edit, :update, :destroy]

  resources :organizations do
    member do
      get :analytics
    end
  end

  resources :memberships

  resources :proposals
  resources :dashboard, only: [:index]

  namespace :admin do
    resources :abilities, only: [:index] do
      collection do
        patch :update, as: :update
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end