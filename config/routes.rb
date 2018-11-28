Rails.application.routes.draw do
  resources :line_items, except: [:edit]
  resources :carts, except: [:edit]
  resources :items
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  root 'items#index'
end
