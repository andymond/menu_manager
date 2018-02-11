require "rails_helper"

describe "default user navigates to user profile" do
  context "user views own profile" do
    it "displays detailed user information" do
      user = create(:user)

      visit user_path(user)

      expect(page).to have_content(user.username)
      expect(page).to have_content(user.email)
      expect(page).to have_content(user.role)
      expect(page).to have_content(user.created_at)
    end
  end
end
