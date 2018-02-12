require "rails_helper"

describe "admin can delete category" do
  it "allows admin to delete category from category index" do
    admin = create(:admin, role: "admin")
    category = create(:category)

    visit categories_path
    click_on "#delete#{category.name}"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Deleted #{category.name}.")
  end
end
