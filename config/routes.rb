Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :foods, only: [:create, :index, :destroy]

  resources :recipes
  
  get '/public_recipes', to: 'public_recipe#index'

  get '/general_shopping_list', to: 'general_shopping_list#index'
   
  # Defines the root path route ("/")
  root "recipes#index"
end
