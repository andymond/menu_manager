class RecipeCategoriesController < ApplicationController
  def new
    @recipe_recipe_category = RecipeCategory.new
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @rc = RecipeCategory.new(rc_params)
    if @rc.save
      redirect_to recipe_path(params[:recipe_id])
    else
      render :new
    end
  end

  private

  def rc_params
    params.require(:recipe_category).permit(:category_id).merge(recipe_id: params[:recipe_id])
  end
end
