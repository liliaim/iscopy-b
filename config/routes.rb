Rails.application.routes.draw do
  devise_for :users
  # get 'plans/index'
  root to: "plans#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :plans
  resources :records
  resources :users, only: :show

end
