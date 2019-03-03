Rails.application.routes.draw do

  get 'taprooms/search' => 'taprooms#search'

  resources :reviews
  resources :users
  resources :taprooms

  resources :taprooms do
    resources :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
