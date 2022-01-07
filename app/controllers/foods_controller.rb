class FoodsController < ApplicationController
  def index
    @foods = Food.where(user_id: @user.id)
    @bg_index = 0
    @bg_color = ['gray', 'default']
  end

  def create
    food = Food.new(food_params)

    if food.save
      flash[:success] = 'Food saved successfully'
      redirect_to foods_path
    else
      flash[:error] = 'We could not saved your food, try again?'
      redirect_to new_food_path
    end
  end

  def new
  end

  def destroy
    food = Food.find_by_id(params[:id])
    food.destroy
    redirect_back(fallback_location: root_path)
  end

  protected

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :user_id)
  end
end
