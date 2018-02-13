require "rails_helper"

describe "admin can alter existing recipes categories" do
  it "allows admin to set recipe categories from existing categories" do
    admin = create(:user, role: 1)
    recipe = create(:recipe, user_id: admin.id)
    category = create(:category)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_recipe_path(recipe)
    select(category.name, :from => "recipe[category_ids][]")
    click_on "Set Recipe Categories"

    expect(page).to have_content("#{recipe.name} updated.")
    expect(recipe.category_ids).to include(category.id)
  end
  it "allows user to add new category" do
    admin = create(:user, role: 1)
    recipe = create(:recipe, user_id: admin.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_recipe_path(recipe)
    click_on "New Category"

    expect(current_path).to eq(new_category_path)
  end
end
