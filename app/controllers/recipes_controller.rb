class RecipesController < ApplicationController

  def index
    @recipes = Recipe.where(status: :complete)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: "#{@recipe.name} created."
    else
      flash.now[:notice] = "#{@recipe.name} was not created due to an error."
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id]) #current_user.recipes.find_by(id: params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: "#{@recipe.name} updated."
    else
      flash.now[:notice] = "#{@recipe.name} was not updated due to an error."
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id]) #current_user.recipes.find_by(id: params[:id])
    @recipe.destroy

    redirect_to recipes_path, notice: "#{@recipe.name} was deleted."
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :status, :instructions, :employee_credit, :image)
  end

end
