class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.string :name

      t.timestamps
    end

    change_table :inventories do |t|
      add_reference :inventories, :user, null: false, foreign_key: true
    end
  end
end
