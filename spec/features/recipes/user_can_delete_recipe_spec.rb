require "rails_helper"

describe "logged in user can only delete their own recipes" do
  before(:example) do
    @user = create(:user)
    visit login_path
    fill_in "email", with: @user.email
    fill_in "password", with: @user.password
    click_on "Log in"
  end
  it "allows user to delete own recipe" do
    recipe = create(:recipe, user_id: @user.id)

    visit recipe_path(recipe)
    click_on "Delete Recipe"

    expect(current_path).to eq(recipes_path)
    expect(page).to have_content("#{recipe.name} was deleted.")
  end
  it "doesnt allow user to delete another user's recipe" do
    user_2 = create(:user)
    recipe = create(:recipe, user_id: user_2.id)

    visit recipe_path(recipe)

    expect(page).to_not have_content("Delete Recipe")
  end
end
