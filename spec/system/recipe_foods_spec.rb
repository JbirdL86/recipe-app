require 'rails_helper'
require './spec/mock_seed_module'

describe 'RecipeFoods routes when', type: :feature do
  include MockSeed
  context 'logged in' do
    before :each do
      init_seed
      visit new_user_session_path
      within('form') do
        fill_in 'user_email', with: 'foo0@foo.com'
        fill_in 'user_password', with: 'admin123'
      end
      @user = User.where(email: 'foo0@foo.com')[0]
      click_button 'Log in'
    end

    it 'should render edit view' do
      recipe = Recipe.where(user_id: @user.id).limit(1)[0]
      recipe_food = RecipeFood.where(recipe_id: recipe.id).limit(1)[0]
      visit edit_recipe_recipe_food_path(recipe.id, recipe_food.id)
      expect(page).to have_content "Food for Recipe Nº: #{recipe.id}"
    end

    it 'should render new view' do
      recipe = Recipe.where(user_id: @user.id).limit(1)[0]
      visit new_recipe_recipe_food_path(recipe.id)
      expect(page).to have_content "By - #{@user.name}"
    end
  end

  describe 'logged out' do
    before :each do
      init_seed
      @user = User.where(email: 'foo0@foo.com')[0]
    end
    
    it 'shouldnt render edit view' do
      recipe = Recipe.where(user_id: @user.id).limit(1)[0]
      recipe_food = RecipeFood.where(recipe_id: recipe.id).limit(1)[0]
      visit edit_recipe_recipe_food_path(recipe.id, recipe_food.id)
      expect(page).to have_content 'Unauthorized access, please login to continue!'
    end

    it 'shouldnt render new view' do
      recipe = Recipe.where(user_id: @user.id).limit(1)[0]
      visit new_recipe_recipe_food_path(recipe.id)
      expect(page).to have_content 'Unauthorized access, please login to continue!'
    end
  end
end