Rails.application.routes.draw do


  resources :user_details

  get 'purchases', to: 'user_details#previous_purchases', as: "purchases"
  get 'sales', to: 'user_details#sales', as: "sales"

  get 'messages/index'
  get 'conversations/index'
  
  resources :favourites

  root to: "racquets#index"

  resources :racquets do
    collection do
      match 'search' => 'racquets#search', via: [:get, :post], as: :search
    end
      post :increment_page_views
  end
  get 'racquets_admin_index', to: 'racquets#admin_index'


  devise_for :users, controllers: { registrations: "registrations" }

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

end
