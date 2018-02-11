require "rails_helper"

describe "user can see and index of all users" do
  it "displays all users & their role on index" do
    user = create(:user)
    user_2 = create(:user)
    admin = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit users_path

    expect(page).to have_content(user.username)
    expect(page).to have_content(user_1.username)
    expect(page).to have_content(adming.username)
    expect(page).to have_content(admin.role)
    expect(page).to have_content(admin.role)
    expect(page).to have_content(admin.role)
  end
end
