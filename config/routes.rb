Rails.application.routes.draw do

  resources :locations
  resources :user_details
  resources :shopping_carts
  resources :racquets
  resources :statuses
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "pages#index"

  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
