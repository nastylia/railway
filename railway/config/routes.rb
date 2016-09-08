Rails.application.routes.draw do
  resources :trains
  get 'welcome/index'

  resources :railway_stations

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
