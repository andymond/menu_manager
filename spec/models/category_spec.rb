require "rails_helper"

describe Category, type: :model do
  describe "validations" do
    it "is valid with a name" do
      category = create(:category)

      expect(category).to be_valid
    end
    it "is invalid without a unique name" do
      category = create(:category)
      category_2 = Category.create(name: category.name)

      expect(category_2).to be_invalid
    end
    it "is invalid without a name" do
      category = Category.create(name: "")

      expect(category).to be_invalid
    end
  end
  describe "relationships" do
    it {should have_many(:recipe_categories)}
    it {should have_many(:recipes)}
  end
end
