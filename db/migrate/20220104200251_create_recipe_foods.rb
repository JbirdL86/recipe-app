class CreateRecipeFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity

      t.timestamps
    end

    change_table :recipe_foods do |t|
      add_reference :recipe_foods, :recipe, null: false, foreign_key: true
      add_reference :recipe_foods, :food, null: false, foreign_key: true
    end
  end
end
