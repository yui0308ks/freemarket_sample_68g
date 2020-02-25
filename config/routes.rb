Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  root "items#index"

  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  resources :users, only: :show
  devise_scope :user do
    get  'signup',    to: 'users/registrations#index'
    get  'addresses',  to: 'users/registrations#new_address'
    post  'addresses',  to: 'users/registrations#create_address'
    get  'logout',    to: 'users/sessions#logout'
  end
  resources :items, except: :show do
    collection do
      get 'category'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_size', defaults: { format: 'json' }
      get 'get_delivery_method'
      
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

  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end

  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end

end
