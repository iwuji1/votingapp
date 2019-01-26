Rails.application.routes.draw do
  get 'front_pages/home'

  get 'front_pages/help'

  resources :options
  resources :candidates
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
end
