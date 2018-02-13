require "rails_helper"

describe "user visits category show page" do
  it "shows recipes in category" do
    user = create(:user)
    recipe_1 = create(:recipe)
    recipe_2 = create(:recipe)
    recipe_3 = create(:recipe)
    category = create(:category)
    category_2 = create(:category)
    RecipeCategory.create(recipe_id: recipe_1.id, category_id: category.id)
    RecipeCategory.create(recipe_id: recipe_2.id, category_id: category.id)
    RecipeCategory.create(recipe_id: recipe_3.id, category_id: category_2.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit category_path(category)

    expect(page).to have_content(recipe_1.name.capitalize)
    expect(page).to have_content(recipe_2.name.capitalize)
    expect(page).to_not have_content(recipe_3.name.capitalize)
  end
end
