class Admin::RecipesController < Admin::BaseController
  def index
    @recipes = Recipe.all
  end

  def edit
    @admin = current_admin
    @recipe = Recipe.find(params[:id])
    @users = User.all
  end
end
