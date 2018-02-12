class Admin::CategoriesController < Admin::BaseController
  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to category_path(@category), notice: "Category '#{@category.name.capitalize}' updated."
    else
      render :edit, notice: "#{@category.name} could not be updated."
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
