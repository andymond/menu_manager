class RecipesController < ApplicationController
  before_action :require_login
  before_action :set_recipe, only: [:show, :update, :destroy]

  def index
    @recipes = Recipe.where("user_id = ? OR status = ?", current_user.id, 0)
  end

  def show
    @comment = Comment.new
    @comment.recipe_id = @recipe.id
  end

  def new
    @recipe = current_user.recipes.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      @recipe.category_ids = params[:recipe][:category_ids]
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
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: "#{@recipe.name} updated."
    else
      flash.now[:notice] = "#{@recipe.name} was not updated due to an error."
      render :edit
    end
  end

  def destroy
    if @recipe.nil?
      redirect_to user_path(current_user), notice: "You can only edit your own recipes."
    else
      @recipe.destroy
      flash.notice = "#{@recipe.name} was deleted."
      if current_user.admin?
        redirect_to admin_recipes_path
      else
        redirect_to recipes_path
      end
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :status, :instructions, :image, :category_ids)
  end

  def require_login
    redirect_to root_path, notice: "Please log in to access MenuManager." if current_user.nil?
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
