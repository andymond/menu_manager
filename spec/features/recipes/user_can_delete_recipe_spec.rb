require "rails_helper"

describe "logged in user can delete existing recipe" do
  before(:example) do
    user = create(:user)
    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_on "Log in"
  end
  it "allows user to delete recipe" do
    recipe = create(:recipe)

    visit recipe_path(recipe)
    click_on "Delete Recipe"

    expect(current_path).to eq(recipes_path)
    expect(page).to have_content("#{recipe.name} was deleted.")
  end
end
