Rails.application.routes.draw do
  get 'sessions/new'
  get 'ballots/new'

  resources :votes
  resources :front_pages

  root 'front_pages#home'

  get '/help', to: 'front_pages#help'
  get '/vote', to: 'vote#index'
  get '/thanks', to: 'front_pages#thankyou'
  get '/dat', to: 'front_pages#dataform'
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
