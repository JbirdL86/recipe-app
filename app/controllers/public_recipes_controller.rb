class PublicRecipesController < ApplicationController
  load_and_authorize_resource
  
  def index
    @recipes = Recipe.where(public: true).order(id: :DESC).includes(:user, recipe_foods: [:food])
  end
end
