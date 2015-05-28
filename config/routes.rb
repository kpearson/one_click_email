Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
    post "orders", to: "orders#create", as: "create_order"
  resources :users,  only: [:index, :show]
end
