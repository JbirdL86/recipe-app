Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users

  resources :foods, only: [:create, :index, :destroy, :new]

  resources :recipes do 
    resources :recipe_foods, only: [:create, :update, :new, :destroy, :edit]
  end

  get '/public_recipes', to: 'public_recipes#index'

  get '/general_shopping_lists', to: 'general_shopping_lists#index'
   
  # Defines the root path route ("/")
  root "recipes#index"
end
