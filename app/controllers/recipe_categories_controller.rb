class RecipeCategoriesController < ApplicationController
  def new
    @recipe_recipe_category = RecipeCategory.new
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @rc = RecipeCategory.find_or_create_by(rc_params)
    if @rc.save
      flash.notice = "Recipe Categories updated."
      redirect_to recipe_path(params[:recipe_id])
    else
      flash.notice = "Failed to update Recipe Categories."
      render :new
    end
  end

  private

  def rc_params
    params.require(:recipe_category).permit(:category_id).merge(recipe_id: params[:recipe_id])
  end
end
