require "rails_helper"

describe "User visits recipes index" do
  context "as admin" do
    it "allows admin to view all recipes" do
      admin = create(:user, role: 1)
      create(:recipe, user_id: admin.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_recipes_path
      expect(page).to have_content("All Chef Recipes")
      expect(page).to have_link("Delete")
      expect(page).to have_link("Edit")
    end
  end
  context "as default user" do
    it "doesn't allow default user to view all recipes" do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_recipes_path
      expect(page).to_not have_content("All Chef Recipes")
      expect(page).to have_content("The page you were looking for doesn't exist (404)")
    end
  end
end
