require 'resque/server'
Rails.application.routes.draw do
  root to: 'static_pages#home'

  resources :listings, only: [:index, :show]
  resources :reservations do
    member do
      post '/cancel' => 'reservations#cancel'
      get '/expire' => 'reservations#expire'
    end
  end
  post '/webhooks/:source' => 'webhooks#create'

  namespace :host do
    resources :merchant_settings do
      collection do
        get :connect, to: 'merchant_settings#connect'
        get :connected, to: 'merchant_settings#connected'
      end
    end
    resources :listings do
      resources :photos, only: [:index, :create, :destroy]
      resources :rooms, only: [:index, :create, :destroy]
    end
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resque_web_constraint = lambda do |request|
    current_user = request.env['warden'].user
    current_user.id == 1
  end
  constraints resque_web_constraint do
    mount Resque::Server, at: '/jobs'
  end
end
