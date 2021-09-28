Rails.application.routes.draw do
  root to: 'static_pages#home'

  namespace :host do
    resources :listings
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
