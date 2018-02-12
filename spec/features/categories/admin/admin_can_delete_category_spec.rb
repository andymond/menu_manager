require "rails_helper"

describe "admin can delete category" do
  it "allows admin to delete category from category index" do
    admin = create(:user, role: 1)
    category = create(:category)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit categories_path
    click_link "delete#{category.name}"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("#{category.name.capitalize} deleted.")
  end
end
