Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  devise_for :users

  root to: 'items#index'
  resources :items do
    resources :itemsends
  end
  # resources :buylogs
  # resources :itemsends

  # resources :items do
  #   resources :orders , only: [:index, :create]
  # end
end
