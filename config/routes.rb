Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :foods, only: [:create, :index, :destroy]

  resources :recipes
  
  resources :public_recipes, only: :index

  resources :general_public_list, only: :index 
  # Defines the root path route ("/")
  root "recipes#index"
end
