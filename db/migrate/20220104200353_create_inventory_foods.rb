class CreateInventoryFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :inventory_foods do |t|
      t.integer :quantity

      t.timestamps
    end

    change_table :inventory_foods do |t|
      add_reference :inventory_foods, :user, null: false, foreign_key: true
      add_reference :inventory_foods, :food, null: false, foreign_key: true
    end
  end
end
