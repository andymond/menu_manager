require "rails_helper"

describe "user can create recipe" do
  it "allows user to create recipe" do
    visit new_recipe_path

    fill_in"recipe[name]", with: "Waffles"
    fill_in"recipe[instructions]", with: "Make the waffles"
    fill_in"recipe[status]", with: "Incomplete"
    click_on "Create Recipe"

    expect(page).to have_content("Waffles")
    expect(page).to have_content("Make the waffles")
    expect(page).to have_content("Incomplete")
  end
end
