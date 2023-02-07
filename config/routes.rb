Rails.application.routes.draw do
  devise_for :users
  root to: "bikes#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "bikes", to: "bikes#index"
  get "bikes", to: "bikes#new"
  post "bikes", to: "bikes#create"
  get "bikes", to: "bikes#show"
  get "bikes", to: "bikes#edit"
  patch "bikes", to: "bikes#update"
  delete "bikes", to: "bikes#destroy"





end
