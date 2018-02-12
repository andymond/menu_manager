class CategoriesController < ApplicationController
  before_action :require_login

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: "Category '#{@category.name.capitalize}' created."
    else
      flash.now = "Failed to create category."
      render :new
    end
  end

  private

  def require_login
    redirect_to root_path, notice: "Please log in to access MenuManager." if current_user.nil?
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
