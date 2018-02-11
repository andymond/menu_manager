require "rails_helper"

describe "admin can edit any recipe"
  context "admin can edit any recipe" do
    it "allows admin to delete own recipe" do
      admin = create(:user, role: 1)
      user = create(:user)
      recipe_1 = create(:recipe, user_id: user.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit recipe_path(recipe_1)
      click_on "Edit Recipe"

      expect(current_path).to eq(edit_admin_recipe_path(recipe_1))

      fill_in "name", with: "Pasta"
      fill_in "instructions", with: "Boil the pasta"
      select("complete", :from => "recipe[status]")
      select(admin.username, :from => "recipe[user]")
      click_on "Update Recipe"

      expect(page).to have_content("#{recipe_1.name} was updated.")
      expect(current_path).to eq(recipe_path(recipe_1))
    end
  end
