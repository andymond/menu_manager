require "rails_helper"

describe "logged-in user can edit recipe" do
  before(:example) do
    @user = create(:user)
    visit login_path
    fill_in "email", with: @user.email
    fill_in "password", with: @user.password
    click_on "Log in"
  end
  it "allows user to edit own recipe" do
    recipe = create(:recipe, user_id: @user.id)
    visit edit_recipe_path(recipe)

    fill_in"recipe[name]", with: "Waffles"
    fill_in"recipe[instructions]", with: "Make the waffles"
    click_on "Submit Recipe For Review"

    expect(page).to have_content("Waffles")
    expect(page).to have_content("Make the waffles")
    expect(page).to have_content("for_review")
    expect(page).to have_content("Waffles updated.")
  end
  it "doesn't allow user to edit other recipes" do
    recipe = create(:recipe)

    visit edit_recipe_path(recipe)

    expect(current_path).to eq(user_path(@user))
    expect(page).to have_content("You can only edit your own recipes.")
  end
end
