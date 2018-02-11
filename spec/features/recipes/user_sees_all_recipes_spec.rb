require "rails_helper"

describe "logged in default user sees all complete recipes" do
  before(:example) do
    user = create(:user)
    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_on "Log in"
  end
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
