Rails.application.routes.draw do
  root "donuts#index"
  resources :donuts
  devise_for :users
end
