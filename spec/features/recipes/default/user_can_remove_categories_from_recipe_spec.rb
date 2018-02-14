require "rails_helper"

describe "user can remove category from recipe" do
   it "allows user to remove category" do
     user = create(:user)
     recipe = create(:recipe)
     category = create(:category)
     recipe.recipe_categories.create(category_id: category.id)

     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

     visit admin_recipe_path(recipe)

     expect(page).to have_content(category.name)

     click_on "Remove Recipe"

     select category.name, from: "categories"
     click_on "Remove Recipe"

     expect(current_path).to eq(admin_recipe_path(recipe))
     epect(page).to_not have_content(category.name)
   end
end
