class CategoriesController < ApplicationController
  before_action :require_login

  def index
    @categories = Category.all
  end

  private

  def require_login
    redirect_to root_path, notice: "Please log in to access MenuManager." if current_user.nil?
  end
end
