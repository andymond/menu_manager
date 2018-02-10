require "rails_helper"

describe "user navigates to user show page" do
  it "displays recipe name and instructions" do
    recipe = create(:recipe)

    visit recipe_path(recipe)

    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.instructions)
  end
end
