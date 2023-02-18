Rails.application.routes.draw do
  # get 'index/new'
  # get 'index/create'
  # get 'index/show'
  # get 'index/destroy'
  devise_for :users
  root to: "bikes#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/checkout", to: "bookings#checkout"

  resources :bikes do
    resources :bookings, only: [:new, :create]
  end
end
