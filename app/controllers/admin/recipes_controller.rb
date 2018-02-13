class Admin::RecipesController < Admin::BaseController
  def index
    @recipes = Recipe.all
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @users = User.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    recipe_categories = params[:recipe][:category_ids]
    recipe_categories.shift unless recipe_categories.nil?
    @recipe.category_ids = recipe_categories
    flash.notice = "#{@recipe.name} updated."
    redirect_to admin_recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:user_id, :name, :instructions, :status, :image, :category_ids => [])
  end
end
