Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    authenticated :user do
      root 'recipe#index', as: :authenticated_root
    end
    
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end 

  resources :foods, only: [:create, :index, :destroy]

  resources :recipes
  
  get '/public_recipes', to: 'public_recipe#index'

  get '/general_shopping_list', to: 'general_shopping_list#index'
   
  # Defines the root path route ("/")
  root "recipe#index"
end
