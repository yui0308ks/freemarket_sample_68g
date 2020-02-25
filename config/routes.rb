Rails.application.routes.draw do
  root "items#index"

  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  resources :users, only: [:show ,:destroy]
  devise_scope :user do
    get  'signup',    to: 'users/registrations#index'
    get  'addresses',  to: 'users/registrations#new_address'
    post  'addresses',  to: 'users/registrations#create_address'
    get  'logout',    to: 'users/sessions#logout'
  end
  
  resources :items, except: :show do
    resources :comments, only: :create
    collection do
      get 'category'
      get 'get_delivery'
      # get 'get_size', defaults: { format: 'json' }

    end
    
  end

  resources :signups, only: [:new, :create] do
    collection do
      
      get 'member'
      post 'address'
      post 'telephone'
      get 'login'
    end
  end
end
