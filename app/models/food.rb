class Food < ApplicationRecord
  belongs_to :user
  has_many :inventory_foods, dependent: :destroy
  has_many :recipe_foods, dependent: :destroy
  validates :name, :measurement_unit, presence: true
  validates :price, presence: true, numericality: { only_decimal: true, greater_than: 0 }
end
