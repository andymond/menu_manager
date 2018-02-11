require "rails_helper"

describe "logged-in user can create recipe" do
  before(:example) do
    user = create(:user)
    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_on "Log in"
  end
  it "allows user to create recipe with required attrs" do
    visit new_recipe_path

    fill_in"recipe[name]", with: "Waffles"
    fill_in"recipe[instructions]", with: "Make the waffles"
    click_on "Submit Recipe For Review"

    expect(page).to have_content("Waffles")
    expect(page).to have_content("Make the waffles")
    expect(page).to have_content("for_review")
    expect(page).to have_content("Waffles created.")
  end
  it "doesn't allow user to create recipe without all required attrs" do
    visit new_recipe_path

    fill_in"recipe[name]", with: "Waffles"
    click_on "Submit Recipe For Review"

    expect(page).to have_content("Waffles was not created due to an error.")
  end
end
describe "logged out user can't see new recipe path" do
  it "redirects logged out users to root" do
    visit new_recipe_path

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Please log in to access MenuManager.")
  end
end
