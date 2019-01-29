Rails.application.routes.draw do

  # get 'votes/index'
  #
  # get 'votes/new'
  #
  # get 'votes/create'

  root 'front_pages#home'

  get '/help', to: 'front_pages#help'
  get '/vote', to: 'front_pages#vote'
  get '/login', to:'users#new'
  post '/login', to:'users#create'

  resources :users do
    resources :votes, only: [:create, :new]
  end

  resources :votes, only: [:index]



  #get 'front_pages/home'

  #get 'front_pages/help'

  #get 'front_pages/vote'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
