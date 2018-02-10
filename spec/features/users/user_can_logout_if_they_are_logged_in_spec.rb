require "rails_helper"

describe "user can login if they have an account" do
  it "allows login for registered user" do
    user = create(:user)

    visit login_path

    fill_in "email", with: user.email
    fill_in "password", with: user.password

    click_on "Log in"

    expect(current_path).to eq(user_path(user))

    click_on "Logout"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Logged out.")
    # expect(current_user).to be(nil)
  end
end
