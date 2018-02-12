require "rails_helper"

describe "user can't edit existing categories" do
  it "doesn't allow user to edit categories" do
    user = create(:user)
    category = create(:category)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_admin_category_path(category)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
  it "doesn't show user edit or delete links on index or show" do
    user = create(:user)
    category = create(:category)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit categories_path

    expect(page).to_not have_content("Edit")
    expect(page).to_not have_content("Delete")

    visit category_path(category)

    expect(page).to_not have_content("Edit")
    expect(page).to_not have_content("Delete")
  end
end
