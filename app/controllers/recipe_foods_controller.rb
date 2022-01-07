class RecipeFoodsController < ApplicationController
  def create
    @recipe = Recipe.new(recipe_params)
    return unless @recipe.save

    flash[:succes] = 'Recipe successfully created!'
    redirect_to recipes_path
  end

  protected

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :coocking_time, :description, :public, :user_id)
  end
end
