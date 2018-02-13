require "rails_helper"

describe "admin can delete any recipe"
  context "as admin" do
    it "allows admin to delete any recipe from show page" do
      admin = create(:user, role: 1)
      user = create(:user)
      recipe_1 = create(:recipe, user_id: user.id)
      recipe_2 = create(:recipe, user_id: admin.id, status: "complete")
      recipe_3 = create(:recipe, user_id: admin.id, status: "in_progress")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_recipe_path(recipe_1)
      click_on "Delete Recipe"

      expect(current_path).to eq(recipes_path)
      expect(page).to have_content("#{recipe_1.name} was deleted")
      expect(page).to_not have_content(recipe_1)

      visit recipe_path(recipe_2)
      click_on "View Recipe Details"
      expect(current_path).to eq(admin_recipe_path(recipe_2))
      click_on "Delete Recipe"

      expect(current_path).to eq(recipes_path)
      expect(page).to have_content("#{recipe_2.name} was deleted")
      expect(page).to_not have_content(recipe_2)

      visit admin_recipe_path(recipe_3)
      click_on "Delete Recipe"

      expect(current_path).to eq(recipes_path)
      expect(page).to have_content("#{recipe_3.name} was deleted")
      expect(page).to_not have_content(recipe_3)
    end
  end
