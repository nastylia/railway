Rails.application.routes.draw do
  resources :trains do
    resources :carriages, shallow: true
  end
  resources :users
  resources :tickets
  get 'welcome/index'
  
  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_arrival, on: :member
    patch :update_departure, on: :member
  end
  resources :routes

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
