require "rails_helper"

describe "admin can edit any recipe"
  context "admin can edit any recipe" do
    it "allows admin to edit other user's recipe" do
      admin = create(:user, role: 1)
      user = create(:user)
      recipe_1 = create(:recipe, user_id: user.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit edit_admin_recipe_path(recipe_1)

      expect(current_path).to eq(edit_admin_recipe_path(recipe_1))
      fill_in "recipe[name]", with: "Pasta"
      fill_in "recipe[instructions]", with: "Boil the pasta"
      select("Complete", :from => "recipe[status]")
      select(admin.username, :from => "recipe[user_id]")
      click_on "Update Recipe"

      expect(page).to have_content("Pasta updated.")
      expect(current_path).to eq(recipe_path(recipe_1))
    end
    it "allows admin to edit their own recipe" do
      admin = create(:user, role: 1)
      recipe_1 = create(:recipe, user_id: admin.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit edit_admin_recipe_path(recipe_1)

      expect(current_path).to eq(edit_admin_recipe_path(recipe_1))
      fill_in "recipe[name]", with: "Pasta"
      fill_in "recipe[instructions]", with: "Boil the pasta"
      select("Complete", :from => "recipe[status]")
      select(admin.username, :from => "recipe[user_id]")
      click_on "Update Recipe"

      expect(page).to have_content("Pasta updated.")
      expect(current_path).to eq(recipe_path(recipe_1))
    end
  end
