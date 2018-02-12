require "rails_helper"

describe "default user can see a list of all categories" do
  it "displays a list of all categories" do
    user = create(:user)
    category_1 = create(:category)
    category_2 = create(:category)
    category_3 = create(:category)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit categories_path

    expect(page).to have_content(category_1.name)
    expect(page).to have_content(category_2.name)
    expect(page).to have_content(category_3.name)
  end
end
