Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'
  end

  namespace :admin do
    get 'customers/index'
  end

  namespace :admin do
    get 'customers/show'
  end

  namespace :admin do
    get 'customers/edit'
  end

  namespace :admin do
    get 'genres/index'
  end

  namespace :admin do
    get 'genres/edit'
  end

  namespace :admin do
    get 'products/index'
  end

  namespace :admin do
    get 'products/new'
  end

  namespace :admin do
    get 'products/show'
  end

  namespace :admin do
    get 'products/edit'
  end

  namespace :admin do
    get 'homes/top'
  end

  get 'products/index'

  get 'products/show'

  get 'cart_items/index'

  get 'orders/index'

  get 'orders/new'

  get 'orders/confirm'

  get 'orders/thanks'

  get 'orders/show'

  get 'delivery_addresses/index'

  get 'delivery_addresses/edit'

  get 'customers/show'

  get 'customers/edit'

  get 'customers/quit'

  get 'customers/out'

  get 'customers/index'

  get 'homes/top'

  get 'homes/about'

  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
