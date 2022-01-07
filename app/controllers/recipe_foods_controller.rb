class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find_by_id(params[:recipe_id])
    filter_unused_foods(@recipe.id)
    @recipe_foods = RecipeFood.where(recipe_id: @recipe.id).includes(:food)
    @bg_index = 0
    @bg_color = %w[gray default]
  end

  def edit
    @recipe = Recipe.find_by_id(params[:recipe_id])
    @recipe_food = RecipeFood.where(recipe_id: @recipe.id).includes(:food)
  end

  def update
    @recipe_food = RecipeFood.find_by_id(params[:id])

    @recipe_food.update(update_recipe_food_params)

    redirect_to recipe_path(params[:recipe_id])
  end

  def destroy
    @recipe_food = RecipeFood.find_by_id(params[:id])

    @recipe_food.destroy

    redirect_back(fallback_location: root_path)
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    return unless @recipe_food.save

    flash[:succes] = 'Recipe successfully created!'
    redirect_back(fallback_location: root_path)
  end

  protected

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
  end

  def update_recipe_food_params
    params.require(:recipe_food).permit(:quantity)
  end

  def filter_unused_foods(recipe_id)
    all_foods = Food.where(user_id: @user.id)
    @foods = []
    all_foods.each do |food|
      recipe_foods = food.recipe_foods

      recipe_foods.each_with_index do |recipe_food, index|
        break if recipe_food.recipe_id == recipe_id

        @foods << food if index == recipe_foods.length - 1
      end
    end
  end
end
