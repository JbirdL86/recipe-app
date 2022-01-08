class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, presence: true
  validates :cooking_time, presence: true
  validates :preparation_time, presence: true
end
