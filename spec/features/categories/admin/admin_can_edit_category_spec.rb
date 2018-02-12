require "rails_helper"

describe "admin can edit an existing category" do
  it "allows adin to edit existing category from index" do
    admin = create(:user, role: 1)
    category = create(:category)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit categories_path
    click_on(class: "edit#{category.name}")

    expect(current_path).to eq(edit_admin_category_path(category))

    fill_in "category[name]", with: "sweet"
    click_on "Update Category"

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content("Category 'Sweet' updated.")
  end
  it "allows adin to edit existing category from show" do
    admin = create(:user, role: 1)
    category = create(:category)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit category_path(category)
    click_on(class: "edit#{category.name}")

    expect(current_path).to eq(edit_admin_category_path(category))

    fill_in "category[name]", with: "sweet"
    click_on "Update Category"

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content("Category 'Sweet' updated.")
  end
end
