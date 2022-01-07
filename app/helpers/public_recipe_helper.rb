module PublicRecipeHelper
  def food_items(recipe)
    recipe.recipe_foods.length
  end

  def food_price(recipe)
    food_price = 0
    recipe.recipe_foods.each do |food|
      food_price += food.quantity * food.food.price
    end
    food_price
  end
end
