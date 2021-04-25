Rails.application.routes.draw do
  devise_for :admins,controllers: {registrations: 'customers/registrations',
                                   sessions: 'customers/sessions' }
  devise_for :customers, controllers: {registrations: 'customers/registrations',
                                       sessions: 'customers/sessions' }

  scope module: :customer do
    root to: 'homes#top'
    delete 'cart_items/destroy_all'
    resources :products
    resources :cart_items,only: [:index,:update,:create,:destroy]
    # resources :orders
    #   get 'orders/comfirm'
    #   get 'orders/thanks'

    resources :orders do
      collection do
        post :comfirm
        get  :thanks
      end
    end
    delete '/cart_items' => 'cart_items#destroy_all'

    resources :delivery_addresses
    resources :customers
      get 'customers/quit'
      get 'homes/about'
    get '/customers/:id/quit' => 'customers#quit', as: 'quit_customer' #退会画面への遷移
    patch '/customers/:id/quit' => 'customers#out', as: 'out_customer' #会員ステータスの切替

  end

  namespace :admin do
    resources :orders do

      member do
        get :one_index
      end
    end 
    resources :customers
    resources :genres
    resources :products
    resources :order_products, only: [:update]

    get "search" => "searches#search"
    # admin_search_path
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
