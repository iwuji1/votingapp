Rails.application.routes.draw do

  get 'sessions/new'

  get 'ballots/new'

  resources :votes
  # get 'votes/index'
  #
  # get 'votes/new'
  #
  # get 'votes/create'

  root 'front_pages#home'

  get '/help', to: 'front_pages#help'
  get '/vot', to: 'votes#new'
  get '/vote', to: 'vote#index'
  get '/thanks', to: 'front_pages#thankyou'
  get '/mass', to: 'votes#massform'
  get '/signup', to:'users#new'
  post '/signup', to:'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  delete '/end_ballot', to: 'ballots#destroy'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  resources :users do
    resources :votes, only: [:create, :new, :massform]
    resources :ballots do
      resources :votes, only: [:create, :new, :index]
    end
  end

  resources :ballots do
    resources :votes, only: [:create, :new, :index]
  end

  #get 'front_pages/home'

  #get 'front_pages/help'

  #get 'front_pages/vote'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
