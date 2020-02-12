Rails.application.routes.draw do
<<<<<<< Updated upstream
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=======
  devise_for :users
  root "items#index"
  resources :items, only: [:index, :new]
>>>>>>> Stashed changes
end
