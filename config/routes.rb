Rails.application.routes.draw do
  namespace :admin do
    root 'products#index'

    resources :products
  end

  devise_for :users

  root 'static_pages#index'

  get '/about', to: 'static_pages#about'

  get '/pd/:id', to: 'products#show', as: 'pd'
  get '/show_cart', to: 'carts#show_cart', as: 'show_cart'
  patch '/cart_submit', to: 'carts#create_order_item', as: 'cart_submit'
  get '/jiesuan', to: 'carts#jiesuan', as: 'jiesuan'

  resources :products, only: [] do
    resources :carts, only: [ :create ]
  end
end
