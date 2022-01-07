class RecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = Recipe.all.order(id: :DESC)
  end

  def new
    @user = current_user
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    return unless @recipe.save

    flash[:succes] = 'Recipe successfully created!'
    redirect_to recipes_path
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
  end

  def destroy
    @recipe = Recipe.find_by_id(params[:id])
    if @recipe.destroy
      flash[:success] = 'Post successfully deleted.'
      redirect_to recipes_path
    else
      flash[:alert] = 'Error: post is not deleted.'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :coocking_time, :description, :public, :user_id)
  end
end
