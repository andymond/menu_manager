require "rails_helper"

describe "user can add category to existing recipe" do
  it "allows user to add existing category" do
    user = create(:user) do
    recipe = create(:recipe, user_id: user.id)
    category = create(:category)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_recipe_path(recipe)
    select(category.name :from => "recipe[category]")
    click_on("Update Recipe")
    end
  end

  it "allows user to add new category" do

  end
 end
