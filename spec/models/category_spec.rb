require "rails_helper"

describe Category, type: :model do
  describe "validations" do
    it "is valid with a name" do
      category = create(:category)

      expect(category).to be_valid
    end
    it "is invalid without a unique name" do
      category = create(:category)
      category_2 = create(:category, name: category.name)

      expect(category_2).to be_invalid
    end
    it "is invalid wihtout a name" do
      category = create(:category, name: "")

      expect(category).to be_invalid
    end
  end
end
