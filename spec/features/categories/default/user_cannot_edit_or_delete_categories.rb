require "rails_helper"

describe "user can't edit existing categories" do
  it "doesn't allow user to edit categories" do
    user = create(:user)
    category = create(:category)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit edit_admin_category_path(category)

    expect(page).to have_content("Doesn't exist")
  end
end
