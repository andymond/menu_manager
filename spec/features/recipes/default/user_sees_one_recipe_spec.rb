require "rails_helper"

describe "user navigates to recipe show page" do
  before(:example) do
    @user = create(:user)
    visit login_path
    fill_in "email", with: @user.email
    fill_in "password", with: @user.password
    click_on "Log in"
  end
  it "displays non-complete recipe instructions if it's the user's recipe" do
    recipe = create(:recipe, user_id: @user.id)

    visit recipe_path(recipe)

    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.instructions)
    expect(page).to have_content(recipe.status)
  end
  it "displays a comment option" do
    recipe = create(:recipe, user_id: @user.id)
    comment = recipe.comments.create(user: "bob", body: "nice!")
    comment_2 = recipe.comments.create(user: "bot", body: "not!")


    visit recipe_path(recipe)
    
    expect(page).to have_content(comment.user)
    expect(page).to have_content(comment.body)
    expect(page).to have_content(comment_2.user)
    expect(page).to have_content(comment_2.body)
  end
end
