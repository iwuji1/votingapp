Rails.application.routes.draw do
  root 'front_pages#home'

  get '/help', to: 'front_pages#help'

  get '/vote', to: 'front_pages#vote'

  get  '/login',  to: 'users#new'
  #get 'front_pages/home'

  #get 'front_pages/help'

  #get 'front_pages/vote'

  resources :options
  resources :candidates
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'front_pages#home'
end
