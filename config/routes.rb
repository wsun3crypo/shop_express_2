Rails.application.routes.draw do
  resources :customer_friends
  resources :merchant_partnerships
  resources :loyalty_programs
  devise_for :customers
  resources :customers
  resources :purchased_products
  resources :products
  resources :coupons
  devise_for :merchants
  resources :merchants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
