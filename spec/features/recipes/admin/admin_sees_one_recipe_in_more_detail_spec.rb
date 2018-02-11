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
    expect(page).to have_content(recipe.created_at)
    expect(page).to have_content(recipe.updated_at)
  end
end
