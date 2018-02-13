require "rails_helper"

describe "user can alter existing recipes categories" do
  it "allows user to set recipes categories from existing categories" do
    user = create(:user)
    recipe = create(:recipe, user_id: user.id)
    category = create(:category)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit recipe_path(recipe)
    select(category.name, :from => "recipe[category_ids][]")
    click_on "Set Recipe Categories"

    expect(page).to have_content("#{recipe.name} updated.")
    expect(page).to have_link(category.name)
  end
  it "allows user to add new category" do
    user = create(:user)
    recipe = create(:recipe, user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit recipe_path(recipe)
    click_on "New Category"

    expect(current_path).to eq(new_category_path)
  end
end
