class GeneralShoppingListsController < ApplicationController
  def index
    return if @user.nil?

    @recipes = Recipe.where(user_id: @user.id).includes(recipe_foods: [:food])
    food_items(@recipes)
    food_value(@recipes)
    food_names_quantities(@recipes)
    @bg_index = 0
    @bg_color = %w[gray default]
  end

  protected

  def food_items(recipes)
    @food_items = 0
    recipes.each do |recipe|
      @food_items += recipe.recipe_foods.length
    end
  end

  def food_value(recipes)
    @food_value = 0
    recipes.each do |recipe|
      recipe.recipe_foods.each do |recipe_food|
        @food_value += recipe_food.food.price * recipe_food.quantity
      end
    end
  end

  def food_names_quantities(recipes)
    @foods = []
    @quantity = []
    recipes.each do |recipe|
      recipe.recipe_foods.each do |recipe_food|
        if @foods.include?(recipe_food.food)
          index = @foods.find_index(recipe_food.food)
          @quantity[index] += recipe_food.quantity
        else
          @foods << recipe_food.food
          @quantity << recipe_food.quantity
        end
      end
    end
  end
end
