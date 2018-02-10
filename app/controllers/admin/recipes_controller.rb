class Admin::RecipesController < Admin::BaseController
  def index
    @recipes = Recipe.all
  end
end
