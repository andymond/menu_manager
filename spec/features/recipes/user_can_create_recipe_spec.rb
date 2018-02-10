require "rails_helper"

describe "user can create recipe" do
  it "allows user to create recipe with required attrs" do
    visit new_recipe_path

    fill_in"recipe[name]", with: "Waffles"
    fill_in"recipe[instructions]", with: "Make the waffles"
    fill_in"recipe[status]", with: "Incomplete"
    click_on "Create Recipe"

    expect(page).to have_content("Waffles")
    expect(page).to have_content("Make the waffles")
    expect(page).to have_content("Incomplete")
    expect(page).to have_content("Waffles created.")
  end
  it "doesn't allow user to create recipe without all required attrs" do
    visit new_recipe_path

    fill_in"recipe[name]", with: "Waffles"
    fill_in"recipe[status]", with: "Incomplete"
    click_on "Create Recipe"

    expect(page).to have_content("Waffles was not created due to an error.")
  end
end
