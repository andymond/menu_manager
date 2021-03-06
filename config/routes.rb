Rails.application.routes.draw do

  root "welcome#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/login", to: "sessions#destroy"

  resources :users
  namespace :admin do
    resources :recipes, except: [:new, :destroy]
    resources :users, only: [:edit, :destroy]
    resources :categories, only: [:edit, :update, :destroy]
    resources :comments, only: [:destroy]
  end
  resources :recipes do
    resources :recipe_categories, only: [:new, :create]
    resources :comments, only: [:new, :create]
  end
  resources :recipe_categories, only: [:destroy]
  resources :categories, except: [:edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
