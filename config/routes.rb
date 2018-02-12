Rails.application.routes.draw do

  root "welcome#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/login", to: "sessions#destroy"

  resources :users
  namespace :admin do
    resources :recipes, except: [:new, :destroy]
    resources :users, only: [:edit, :destroy]
  end
  resources :recipes
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
