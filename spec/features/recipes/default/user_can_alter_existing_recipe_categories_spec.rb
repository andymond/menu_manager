require "rails_helper"

describe "user can alter existing recipes categories" do
  it "allows user to set recipes categories from existing categories" do
    user = create(:user)
    recipe = create(:recipe, user_id: user.id)
    category = create(:category)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit recipe_path(recipe)
    select(category.name, :from => "recipe[category_ids][]")
    click_on("Set Recipe Categories")
  end

  it "allows user to add new category" do

  end
end
