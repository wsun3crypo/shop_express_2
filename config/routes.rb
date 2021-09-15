Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    scope module: 'api/v1', as: 'api' do
      resources :assigned_coupons

      resources :customer_friends

      resources :merchant_partnerships

      resources :loyalty_programs

      resources :customers

      resources :purchased_products

      resources :products

      resources :coupons

      resources :merchants

    end
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "coupons#index"
  resources :product_reviews
  resources :assigned_coupons
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
