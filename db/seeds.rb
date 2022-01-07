# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user_names = ['Hamza', 'Juan', 'Mateo', 'Laylo', 'Nelsino']
food_names = ['Tomato', 'Onion', 'Shrimps', 'Lemon', 'Salt', 'Orange', 'Grape', 'Water', 'Alcohool', 'Watermelon', 'Pitaya', 'Parmesan Cheese', 'Eggplant', 'Some Meat']
user_names.each_with_index do |name, index|
  user = User.create(name: name, email: "foo#{index}@foo.com", password: 'admin123', password_confirmation: 'admin123')
  food_names.each do |f_name|
    Food.create(name: f_name, measurement_unit: 'grams', price: rand(3..30), user_id: user.id )
  end

  recipe1 = Recipe.create(user_id: user.id, name: 'Ceviche', cooking_time: rand(0.2..2.0), preparation_time: rand(0.3..2.3), public: false)
  recipe2 = Recipe.create(user_id: user.id, name: 'Ponche', cooking_time: rand(0.2..2.0), preparation_time: rand(0.3..2.3), public: false)
  recipe3 = Recipe.create(user_id: user.id, name: 'Parmesana', cooking_time: rand(0.2..2.0), preparation_time: rand(0.3..2.3), public: false)

  (0..4).each do |num|
    food = Food.where(user_id: user.id, name: food_names[num])
    RecipeFood.create(food_id: food.ids[0], recipe_id: recipe1.id, quantity: rand(1..10))
  end

  (5..10).each do |num|
    food = Food.where(user_id: user.id, name: food_names[num])
    RecipeFood.create(food_id: food.ids[0], recipe_id: recipe2.id, quantity: rand(1..10))
  end

  (11..13).each do |num|
    food = Food.where(user_id: user.id, name: food_names[num])
    RecipeFood.create(food_id: food.ids[0], recipe_id: recipe3.id, quantity: rand(1..10))
  end
end
