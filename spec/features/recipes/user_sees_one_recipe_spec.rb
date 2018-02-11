require "rails_helper"

describe "user navigates to user show page" do
  before(:example) do
    user = create(:user)
    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_on "Log in"
  end
  it "displays recipe name and instructions" do
    recipe = create(:recipe)

    visit recipe_path(recipe)

    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.instructions)
    expect(page).to have_content(recipe.status)
  end
end
