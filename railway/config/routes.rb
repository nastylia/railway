Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :trains do
      resources :carriages, shallow: true
    end

    resources :trains

    resources :railway_stations do
      patch :update_position, on: :member
      patch :update_arrival, on: :member
      patch :update_departure, on: :member
    end

    resources :tickets, except: [:create, :new, :index, :edit]

    resources :routes
  end

  
  resources :tickets do
    post :buy, on: :member
  end

  resources :users

  get 'welcome/index'
  

  resource :search, only: [:show, :new, :edit, :create ]

  root 'searches#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
