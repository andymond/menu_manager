class Admin::RecipesController < ApplicationController
  before_action :require_admin

  def index
    @recipes = Recipe.all
  end

  private

  def require_admin
    render file: "/public/404" unless current_admin
  end

end
