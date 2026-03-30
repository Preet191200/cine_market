Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)

  root "home#index"

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]

  get  "/cart",                    to: "cart#show",   as: :cart
  post "/cart/add/:product_id",    to: "cart#add",    as: :add_to_cart
  patch "/cart/update/:product_id", to: "cart#update", as: :update_cart
  delete "/cart/remove/:product_id", to: "cart#remove", as: :remove_from_cart
end