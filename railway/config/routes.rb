Rails.application.routes.draw do
  resources :trains
  resources :users
  resources :tickets
  get 'welcome/index'

  resources :railway_stations
  resources :routes

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
