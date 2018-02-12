require "rails_helper"

describe "default user can see a list of all categories" do
  it "displays a list of all categories" do
    user = create(:user)
    category_1 = create(:name)
    category_2 = create(:name)
    category_3 = create(:name)

    allow_all_instances_of(ApplicationRecord).to receive(:current_user).and_return(user)

    visit categores_path

    expect(page).to have_content(category_1.name)
    expect(page).to have_content(category_2.name)
    expect(page).to have_content(category_3.name)
  end
end
