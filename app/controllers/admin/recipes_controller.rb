class Admin::RecipesController < Admin::BaseController
  def index
    @recipes = Recipe.all
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @users = User.all
  end

  def update
    @recipe = Recipe.update(recipe_params)
    flash.notice = "#{@recipe.name} updated."
    redirect_to admin_recipes_path
  end

  

  private

  def recipe_params
    params.require(:recipe).permit(:user_id, :name, :instructions, :status, :image)
  end
end
