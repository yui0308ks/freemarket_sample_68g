Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  root "items#index"
  resources :items, only: [:index, :new]
  resources :signups, only: [:new, :create] do
    collection do
      get 'member'
      post 'address'
      post 'telephone'
      get 'login'
    end
  end
end
