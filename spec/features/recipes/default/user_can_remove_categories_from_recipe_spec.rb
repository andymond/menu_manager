require "rails_helper"

describe "user can remove category from recipe" do
   it "allows user to remove category" do
     user = create(:user)
     recipe = create(:recipe)
     category = create(:category)
     recipe.recipe_categories.create(category_id: category.id)

     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

     visit recipe_path(recipe)

     expect(page).to have_content(category.name)

     click_on "Remove"

     expect(current_path).to eq(recipe_path(recipe))
     expect(page).to have_content("#{category.name} removed from #{recipe.name}")
   end
end
