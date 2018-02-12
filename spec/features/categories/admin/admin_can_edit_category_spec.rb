require "rails_helper"

describe "admin can edit an existing category" do
  it "allows adin to edit existing category" do
    admin = create(:user, role: 1)
    category = create(:category)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit categories_path
    click_on "Edit Category"

    expect_current(path).to eq(edit_admin_category_path(category))

    fill_in "category[name]", with: "sweet"
    click_on "Update Category"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Category 'Sweet' updated.")
  end
end
