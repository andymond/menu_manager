require "rails_helper"

describe "user can login if they have an account" do
  it "allows login for registered user" do
    user = create(:user)

    visit root_path

    click_on "Login"

    expect(current_path).to eq(login_path)
    fill_in "username", with: user.username
    fill_in "password", with: user.password

    click_on "Log in"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_content("Logout")
  end
end
