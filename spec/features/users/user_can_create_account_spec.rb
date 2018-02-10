require "rails_helper"

describe "user can sign up for account" do
  it "allows user to sign up with required information" do
    visit "/"
    click_on "Join MenuManager"

    expect(current_path).to eq(new_user_path)

    fill_in "user[username]", with: "testuser"
    fill_in "user[email]", with: "testuser@example.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_on "Create Account"

    expect(page).to have_content("Welcome, testuser")
  end
end
