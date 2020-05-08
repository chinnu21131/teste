Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "home#index", as: :home
  get "/admin", to: "sessions#show"
  get "/signin", to: "sessions#new", as: :new_sessions
  post "/signin", to: "sessions#create", as: :sessions
  get "/date", to: "order#date"
  get "/date_display", to: "order#date_display"
  resources :users
  resources :menu
  resources :menu_items
  resources :order
  resources :order_items
  resources :cart_items
  delete "/signout", to: "sessions#destroy", as: :destroy_session
end
