require "rails_helper"

describe "User visits recipes index" do
  context "as admin" do
    it "allows admin to view all recipes" do
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_recipes_path
      expect(page).to have_content("All Chef Recipes")
    end
  end
  context "as default user" do
    it "doesn't allow default user to view all recipes" do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_recipes_path
      expect(page).to_not have_content("All Chef Recipes")
      expect(page).to have_content("The page you are looking for does not exist.")
    end
  end
end
