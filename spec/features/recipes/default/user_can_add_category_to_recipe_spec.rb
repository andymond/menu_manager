require "rails_helper"

describe "user can add category to recipe" do
  it "allows a user to add a category to their own recipe" do
    user = create(:user)
    recipe = create(:recipe, user_id: user.id)
    category = create(:category)
    category2 = create(:category)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit recipe_path(recipe)
    click_on "Add Category to Recipe"
    select category.name, from: "recipecategory[category_id]"
    click_on "Update Recipe"

    expect(current_path).to eq(recipe_path(recipe))

    visit recipe_path(recipe)
    click_on "Add Category to Recipe"
    select category2.name, from: "recipecategory[category_id]"
    click_on "Update Recipe"

    expect(page).to have_content(category.name)
    expect(page).to have_content(category2.name)
  end
end
