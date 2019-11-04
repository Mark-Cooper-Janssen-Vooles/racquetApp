Rails.application.routes.draw do

  get 'messages/index'
  get 'conversations/index'
  resources :favourites
  resources :locations
  resources :user_details
  get 'purchases', to: 'user_details#previous_purchases'
  get 'sales', to: 'user_details#sales'
  resources :shopping_carts

  resources :racquets do
    collection do
      match 'search' => 'racquets#search', via: [:get, :post], as: :search
    end
      post :increment_page_views
  end
  get 'racquets_admin_index', to: 'racquets#admin_index'

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

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
