class Admin::RecipesController < Admin::BaseController
  def index
    @recipes = Recipe.all
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end
end
