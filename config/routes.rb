Rails.application.routes.draw do
  devise_for :customers
  resources :customers
  resources :purchased_products
  resources :products
  resources :coupons
  devise_for :merchants
  resources :merchants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
