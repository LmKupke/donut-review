Rails.application.routes.draw do
  root "donuts#index"
  resources :donuts
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  namespace :admin do
    resources :donuts, only: [:index, :destroy]
    resources :users, only: [:index, :show, :destroy]
  end
  resources :vendors
  resources :users, only: [:show, :destroy]
  resources :donuts, only: [:show] do
    resources :reviews do
      resources :votes
    end
  end
end
