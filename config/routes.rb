Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  root to: 'homes#top'

  scope module: :customer do
    resources :products
    resources :cart_items
    resources :orders
      get 'orders/comfirm'
      get 'orders/thanks'
    resources :delivery_addresses
    resources :customers
    get '/customers/:id/quit' => 'customers#quit', as: 'quit_customer' #退会画面への遷移
    patch '/customers/:id/quit' => 'customers#out', as: 'quit_out_customer' #会員ステータスの切替
  end

  namespace :admin do
    resources :orders
    resources :customers
    resources :genres
    resources :products
    get 'homes/top'
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
