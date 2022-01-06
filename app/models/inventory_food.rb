class InventoryFood < ApplicationRecord
  belongs_to :Inventory
  belongs_to :food

end
