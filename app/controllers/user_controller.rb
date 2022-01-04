class UserController < ApplicationController
  def create
    @user = User.new

    redirect_to recipes()
    
  end
end