require "rails_helper"

describe "user can edit recipe" do
  it "allows user to edit recipe" do
    recipe = create(:recipe)
    visit edit_recipe_path(recipe)

    fill_in"recipe[name]", with: "Waffles"
    fill_in"recipe[instructions]", with: "Make the waffles"
    fill_in"recipe[status]", with: "Incomplete"
    click_on "Update Recipe"

    expect(page).to have_content("Waffles")
    expect(page).to have_content("Make the waffles")
    expect(page).to have_content("Incomplete")
  end
end
