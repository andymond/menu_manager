require "rails_helper"

describe "default user navigates to user profile" do
  context "user views own profile" do
    it "displays detailed user information" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      expect(page).to have_content(user.username)
      expect(page).to have_content(user.email)
      expect(page).to have_content(user.role)
      expect(page).to have_content(user.created_at.to_formatted_s(:long).slice(0..-7))
    end
  end
  context "user views another profile" do
    it "displays basic user information" do
      user = create(:user)
      user_2 = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user_2)

      expect(page).to have_content(user_2.username)
      expect(page).to have_content(user_2.email)
      expect(page).to_not have_content(user.role)
      expect(page).to_not have_content(user.created_at.to_formatted_s(:long).slice(0..-7))
    end
  end
end
