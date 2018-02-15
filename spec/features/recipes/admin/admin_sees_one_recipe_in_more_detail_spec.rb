require "rails_helper"

describe "admin navigates to admin recipe show" do
  it "displays all recipe information" do
    admin = create(:user, role: 1)
    recipe = create(:recipe, user_id: admin.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_recipe_path(recipe)

    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.instructions)
    expect(page).to have_content(recipe.status)
    expect(page).to have_content(recipe.user.username)
    expect(page).to have_content(recipe.created_at.to_formatted_s(:long).slice(0..-7))
    expect(page).to have_content(recipe.updated_at.to_formatted_s(:long).slice(0..-7))
  end
  it "allows admin to delete comment" do
    admin = create(:user, role: 1)
    recipe = create(:recipe, user_id: admin.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit recipe_path(recipe)

    fill_in "comment[body]", with: "mixalot"
    click_on "Submit"

    expect(current_path).to eq(recipe_path(recipe))
    expect(page).to have_content("mixalot")

    click_on "Delete Comment"

    expect(current_path).to eq(admin_recipe_path(recipe))
    expect(page).to_not have_content("mixalot")
  end
end
