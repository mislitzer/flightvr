Rails.application.routes.draw do
  root 'welcome#index'
  
  get 'vrmode', to: 'vrmode#index'
  
  # sign-up routes: show page and process form
  get 'signup', to: 'users#new'
  post 'signup',  to: 'users#create'
  
  # log-in routes: show page and process form
  get   'sessions/new'
  get    'login',   to: 'sessions#new'
  post   'login',   to: 'sessions#create'
  
  # log-out routes: process the form
  delete '/logout',  to: 'sessions#destroy'

  # resourceful routes for Create, Retrieve, Update and Destroy users
  resources :users

end
