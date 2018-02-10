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
end
