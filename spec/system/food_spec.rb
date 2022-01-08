require 'rails_helper'
require './spec/mock_seed_module'

describe 'Food routes when', type: :feature do
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

    it 'should render index view' do
      visit foods_path
      expect(page).to have_content "#{Food.where(user_id: @user.id).limit(1).name}"
    end

    it 'should render new view' do
      visit new_food_path
      expect(page).to have_content "New Food:"
    end
  end

  describe 'logged out' do
    it 'shouldnt render index view' do
      visit foods_path
      expect(page).to have_content 'Unauthorized access, please login to continue!'
    end

    it 'shouldnt render new view' do
      visit new_food_path
      expect(page).to have_content 'Unauthorized access, please login to continue!'
    end
  end
end