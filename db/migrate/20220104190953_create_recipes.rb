class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.float :preparation_time
      t.float :cooking_time
      t.string :description
      t.boolean :public

      t.timestamps

      add_reference :recipes, :user, null: false, foreign_key: true
    end
  end
end
