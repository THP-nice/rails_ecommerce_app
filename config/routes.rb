Rails.application.routes.draw do
  root 'items#index'
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  resources :line_items, path: :myorder, except: [:edit]
  resources :carts, path: :mycart, except: [:edit, :new]
  resources :items
  resources :charges
end
