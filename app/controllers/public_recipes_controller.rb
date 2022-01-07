class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true).order(id: :DESC).includes(:user, recipe_foods: [:food])
  end
end