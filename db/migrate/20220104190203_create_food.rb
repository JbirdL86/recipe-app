class CreateFood < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurement_unit
      t.string :string
      t.integer :price

      t.timestamps
      add_reference :foods, :user, null: false, foreign_key: true
    end
  end
end
