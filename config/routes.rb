Rails.application.routes.draw do

  resources :posts
  get 'sessions/new'
  root to: 'taprooms#index'

  get 'users' => 'users#manage'

  get 'home' => 'users#index'
  get 'index' => 'taprooms#all'

  get 'taprooms/search' => 'taprooms#search'
  get 'taprooms/favourite' => 'taprooms#favourite'
  get 'signup' => 'users#new'

  # login/logout routes
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'newlogin' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  post 'posts/:id/publish' => 'posts#publish', as: :post_publish

  resources :reviews
  resources :users
  resources :taprooms

  resources :taprooms do
    resources :reviews
  end

  resources :taprooms do
    resources :posts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
