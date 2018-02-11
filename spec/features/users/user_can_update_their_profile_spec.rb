require "rails_helper"

describe "default user can update their own profile" do
  it "allows them to update their own profile" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)
    click_on "Update Profile"
    fill_in "user[email]", with: "hushpuppies666@hotmail.net"
    click_on "Update User"

    expect(current_path).to eq(user_path(user))

    expect(page).to have_content("hushpuppies666@hotmail.net")
    expect(page).to have_content("User info updated.")
 end
 it "doesn't allow them to update others' profiles" do
   user = create(:user)
   user_2 = create(:user)
   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

   visit user_path(user_2)
   expect(page).to_not have_link("Update User")

   visit edit_user_path(user_2)

   expect(page).to have_content("page doesn't exist")
 end
end
