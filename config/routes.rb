Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  root to: 'homes#top'

  scope module: :customer do
    resources :products
    resources :cart_items
    resources :orders do
      collection do
        get :confirm
        get 'orders/thanks'
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
    resources :orders
    resources :customers
    resources :genres
    resources :products
    get 'homes/top'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end











# 特殊文字	意味
# &nbsp;	通常半角スペース
# &ensp;	&nbsp;よりも少し広い（"n"と同じ幅のスペース）
# &emsp;	&emsp;よりも少し広い（"m"と同じ幅のスペース） ※全角スペースと同等
# &thinsp;	通常半角スペースよりも少し狭い
