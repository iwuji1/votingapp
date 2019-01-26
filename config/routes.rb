Rails.application.routes.draw do
  get 'front_pages/home'

  get 'front_pages/help'

  get 'front_pages/vote'

  resources :options
  resources :candidates
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'front_pages#home'
end
