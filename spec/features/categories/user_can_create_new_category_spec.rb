require "rails_helper"

describe "user can create new category" do
  it "allows user to create category with name" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "categories_path"
    click_on "New Category"

    expect(current_path).to eq(new_category_path)

    fill_in "category[name]", with: "spicy"
    click_on "Create Category"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Category 'Spicy' created.")
  end
end
