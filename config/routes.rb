Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  get "orders/index"
  get "orders/show"
  devise_for :users
  ActiveAdmin.routes(self)

  root "home#index"

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]

  get  "/cart",                      to: "cart#show",   as: :cart
  post "/cart/add/:product_id",      to: "cart#add",    as: :add_to_cart
  patch "/cart/update/:product_id",  to: "cart#update", as: :update_cart
  delete "/cart/remove/:product_id", to: "cart#remove", as: :remove_from_cart

  get  "/checkout",         to: "checkout#new",     as: :checkout
  post "/checkout/confirm", to: "checkout#confirm", as: :checkout_confirm
  post "/checkout",         to: "checkout#create",  as: :checkout_create
  
  resources :orders, only: [:index, :show]
end