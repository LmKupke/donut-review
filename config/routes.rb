Rails.application.routes.draw do
  root "donuts#index"
  resources :donuts
  devise_for :users, controllers: { registrations: "users/registrations"}
  resources :users, only: [:show]
end
