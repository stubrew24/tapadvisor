Rails.application.routes.draw do

  get 'sessions/new'
  root to: 'taprooms#index'

  get 'taprooms/search' => 'taprooms#search'
  get 'taprooms/favourite' => 'taprooms#favourite'
  get 'signup' => 'users#new'

  # login/logout routes
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'newlogin' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  resources :reviews
  resources :users
  resources :taprooms

  resources :taprooms do
    resources :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
