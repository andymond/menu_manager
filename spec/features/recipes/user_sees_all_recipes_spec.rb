require "rails_helper"

describe "user navigates to view all recipes" do
  it "displays list of all completed recipes" do
    recipe_1 = create(:recipe, status: "complete")
    recipe_2 = create(:recipe, status: "complete")
    recipe_3 = create(:recipe, status: "complete")
    recipe_4 = create(:recipe, status: "complete")

    visit recipes_path

    expect(page).to have_content(recipe_1.name)
    expect(page).to have_content(recipe_2.name)
    expect(page).to have_content(recipe_3.name)
    expect(page).to have_content(recipe_4.name)
  end
end
