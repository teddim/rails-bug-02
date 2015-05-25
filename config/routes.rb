Rails.application.routes.draw do
  root "pages#index"
  get "sign-in" => "sessions#new", as: :signin
  post "sign-in" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout
  resources :registrations, only: [:new, :create]
end
