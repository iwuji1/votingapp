Rails.application.routes.draw do

  get 'sessions/new'

  # get 'votes/index'
  #
  # get 'votes/new'
  #
  # get 'votes/create'

  root 'front_pages#home'

  get '/help', to: 'front_pages#help'
  get '/vot', to: 'votes#new'
  get '/vote', to: 'front_pages#vote'
  get '/thanks', to: 'front_pages#thankyou'
  get '/signup', to:'users#new'
  post '/signup', to:'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    resources :votes, only: [:create, :new]
  end

  resources :votes, only: [:index]



  #get 'front_pages/home'

  #get 'front_pages/help'

  #get 'front_pages/vote'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
