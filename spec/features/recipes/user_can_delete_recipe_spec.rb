require "rails_helper"

describe "user can delete existing recipe" do
  it "allows user to delete recipe" do
    recipe = create(:recipe)

    visit recipe_path(recipe)
    click_on "Delete Recipe"

    expect(current_path).to eq(recipes_path)
    expect(page).to have_content("#{recipe.name} was deleted.")
  end
end
