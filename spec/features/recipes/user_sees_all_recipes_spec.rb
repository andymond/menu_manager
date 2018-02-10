require "rails_helper"

describe "user navigates to view all recipes" do
  it "displays list of all current recipes" do
    recipe_1 = create(:recipe)
    recipe_2 = create(:recipe)
    recipe_3 = create(:recipe)
    recipe_4 = create(:recipe)

    visit recipes_path

    expect(page).to have_content(recipe_1.name)
    expect(page).to have_content(recipe_2.name)
    expect(page).to have_content(recipe_3.name)
    expect(page).to have_content(recipe_4.name)
  end
end
