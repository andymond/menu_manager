require "rails_helper"

describe "admins can delete users" do
  it "allows admin to delete user" do
    user = create(:user)
    admin = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit users_path
    click_on "Remove #{user.username}"

    expect(current_path).to eq(users_path)
    expect(page).to have_content("Cook removed from staff.")
    expect(page).to_not have_content(user.username)
  end
end
