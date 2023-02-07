Rails.application.routes.draw do
  get 'index/new'
  get 'index/create'
  get 'index/show'
  get 'index/destroy'
  devise_for :users
  root to: "bikes#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :bikes do
    resources :bookings, only: [:new, :create]
  end
end
