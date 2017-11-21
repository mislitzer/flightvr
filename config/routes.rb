Rails.application.routes.draw do
  get 'vrmode', to: 'vrmode#index'

  root 'welcome#index'
end
