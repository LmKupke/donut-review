Rails.application.routes.draw do
  root "donuts#index"
  resources :donuts
end
