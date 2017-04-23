Rails.application.routes.draw do

  root to: 'shorts#new'

  resources :shorts, path: '/', only: [:show, :create, :new]

end
