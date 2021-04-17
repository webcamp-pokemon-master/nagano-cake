Rails.application.routes.draw do
  
  
  scope module: :customer do
    resources :products
    resources :cart_items
    resources :orders
      get 'orders/comfirm'
      get 'orders/thanks'
    resources :delivery_addresses
    resources :customers
      get 'customers/quit'
  end

  namespace :admin do
    resources :orders
    resources :customers
    resources :genres
    resources :products
    get 'homes/top'
  end


  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
