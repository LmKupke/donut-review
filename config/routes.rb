Rails.application.routes.draw do
  root "donuts#index"
  resources :donuts
  devise_for :users,
    controllers: {
      registrations: "users/registrations",
      sessions: "users/sessions"
    }
  resources :users, only: [:show, :destroy]
end
