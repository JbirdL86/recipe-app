class RecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = Recipe.all.order(id: :DESC)
  end

  def new
    @user = current_user
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    return unless @recipe.save

    flash[:succes] = 'Recipe successfully created!'
    redirect_to recipes_path
  end

  def show; end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :coocking_time, :description, :public, :user_id)
  end
end
