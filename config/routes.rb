Rails.application.routes.draw do

  resources :favourites
  resources :locations
  resources :user_details
  resources :shopping_carts

  resources :racquets do
    collection do
      match 'search' => 'racquets#search', via: [:get, :post], as: :search
    end
  end

  resources :statuses
  devise_for :users, controllers: { registrations: "registrations" }

  root to: "racquets#index"

  # post "/racquets/runracquets/:q", to: "racquets#runracquets", as: "run-racquets"

  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
