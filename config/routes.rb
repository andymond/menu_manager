Rails.application.routes.draw do

  root "welcome#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/login", to: "sessions#destroy"

  resources :users
  namespace :admin do
    resources :recipes, only: [:index]
  end
  resources :recipes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
