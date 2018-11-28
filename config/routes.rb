Rails.application.routes.draw do
  root 'items#index'
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  resources :line_items, except: [:edit]
  resources :carts, path: :cart, except: [:edit]
  resources :items
  resources :charges
end
