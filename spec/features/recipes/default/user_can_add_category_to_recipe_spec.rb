require "rails_helper"

describe "user can add category to recipe" do
  it "allows a user to add a category to their own recipe" do
    user = create(:user)
    recipe = create(:recipe, user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit recipe_path(recipe)
    click_on("Edit Recipe")
    fill_in "recipe[category_list]", with: "recipe_category, recipe_category2"
    click_on "Update Recipe"

    expect(page).to have_content("recipe_category")
    expect(page).to have_content("recipe_category2")
  end
end
