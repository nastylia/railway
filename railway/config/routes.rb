Rails.application.routes.draw do
  resources :trains
  resources :users
  resources :tickets
  resources :carriages
  get 'welcome/index'
  
  resources :railway_stations do
    patch :update_position, on: :member
  end
  resources :routes

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
