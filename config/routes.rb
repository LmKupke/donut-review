Rails.application.routes.draw do
  root "donuts#index"
  resources :donuts
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  resources :vendors
  resources :users, only: [:show, :destroy]
  resources :donuts, only: [:show] do
    resources :reviews
  end
end
