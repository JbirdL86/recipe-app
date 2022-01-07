# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user_names = ['Hamza', 'Juan', 'Mateo', 'Laylo', 'Nelsino']
food_names = ['Apple', 'Orange', 'Grape', 'Watermelon', 'Pitaya']
user_names.each_with_index do |name, index|
  user = User.create(name: name, email: "foo#{index}@foo.com", password: 'admin123', password_confirmation: 'admin123');
  food_names.each do |fruit|
    Food.create(name: fruit, measurement_unit: 'grams', price: rand(3..15), user_id: user.id )
  end
end



