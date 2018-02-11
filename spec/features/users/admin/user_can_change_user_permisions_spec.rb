require "rails_helper"

describe "admin can change user role" do
  it "allows admin to make a default user an admin" do
    admin = create(:user, role: 1)
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit edit_admin_user_path(user)
    select("Admin", from: "user[role]")
    click_on "Update User"

    expect(page).to have_content("#{user.username} updated.")
    expect(current_path).to eq(user_path(user))
  end
end
