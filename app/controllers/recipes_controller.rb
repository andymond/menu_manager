class RecipesController < ApplicationController
  before_action :require_login

  def index
    @recipes = Recipe.where(status: :complete)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = current_user.recipes.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: "#{@recipe.name} created."
    else
      flash.now[:notice] = "#{@recipe.name} was not created due to an error."
      render :new
    end
  end

  def edit
    @recipe = current_user.recipes.find_by(id: params[:id])
    if @recipe.nil?
      redirect_to user_path(current_user), notice: "You can only edit your own recipes."
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    recipe_categories = params[:recipe][:category_ids]
    if @recipe.update(recipe_params)
      recipe_categories.shift unless recipe_categories.nil?
      @recipe.category_ids = recipe_categories
      redirect_to recipe_path(@recipe), notice: "#{@recipe.name} updated."
    else
      flash.now[:notice] = "#{@recipe.name} was not updated due to an error."
      render :edit
    end
  end

  def destroy
    if current_user.admin?
      @recipe = Recipe.find(params[:id])
    else
      @recipe = current_user.recipes.find_by(id: params[:id])
    end
    if @recipe.nil?
      redirect_to user_path(current_user), notice: "You can only edit your own recipes."
    else
      @recipe.destroy
      redirect_to recipes_path, notice: "#{@recipe.name} was deleted."
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :status, :instructions, :image, :category_ids)
  end

  def require_login
    redirect_to root_path, notice: "Please log in to access MenuManager." if current_user.nil?
  end
end
