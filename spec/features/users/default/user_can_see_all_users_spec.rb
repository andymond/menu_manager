require "rails_helper"

describe "user can see and index of all users" do
  it "displays all users & their role on index" do
    user = create(:user)
    user_2 = create(:user)
    admin = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit users_path

    expect(page).to have_content(user.username)
    expect(page).to have_content(user_2.username)
    expect(page).to have_content(admin.username)
    expect(page).to have_content(user.role)
    expect(page).to have_content(user_2.role)
    expect(page).to have_content(admin.role)
    expect(page).to_not have_content("Remove")
    expect(page).to_not have_content("Edit")
  end
  it "displays modification buttons to admins" do
    user = create(:user)
    user_2 = create(:user)
    admin = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit users_path

    expect(page).to have_content("Remove #{user.username}")
    expect(page).to have_content("Remove #{user_2.username}")
    expect(page).to have_content("Remove #{admin.username}")
    expect(page).to have_content("Edit #{user.username}")
    expect(page).to have_content("Edit #{user_2.username}")
    expect(page).to have_content("Edit #{admin.username}")
  end
end
