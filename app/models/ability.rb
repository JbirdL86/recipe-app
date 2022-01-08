class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Recipe, public: true

    return unless user.present? # additional permissions for logged in users

    can :read, Recipe, user_id: user.id
    can :read, RecipeFood
    can :read, Food, user_id: user.id
    can :read, InventoryFood, user_id: user.id
    can :read, Inventory

    can %i[update destroy], Recipe, user_id: user.id
    can %i[update destroy], RecipeFood, user_id: user.id
    can %i[update destroy], Food, user_id: user.id
  end
end
