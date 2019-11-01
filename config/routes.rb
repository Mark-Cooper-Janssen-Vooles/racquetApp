Rails.application.routes.draw do

  resources :favourites
  resources :locations
  resources :user_details
  resources :shopping_carts

  resources :racquets do
    collection do
      match 'search' => 'racquets#search', via: [:get, :post], as: :search
    end
      post :increment_page_views
  end

  resources :statuses
  devise_for :users, controllers: { registrations: "registrations" }

  root to: "racquets#index"

  get 'wilson', to: 'racquets#wilson'
  get 'head', to: 'racquets#head'
  get 'yonex', to: 'racquets#yonex'
  get 'babolat', to: 'racquets#babolat'
  get 'dunlop', to: 'racquets#dunlop'
  get 'gamma', to: 'racquets#gamma'
  get 'prince', to: 'racquets#prince'
  get 'prokennex', to: 'racquets#prokennex'
  get 'technifibre', to: 'racquets#technifibre'
  get 'volkl', to: 'racquets#volkl'

  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
