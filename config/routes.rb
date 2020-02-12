Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items, only: [:index, :new]
  root "items#index"
  devise_for :users

end
