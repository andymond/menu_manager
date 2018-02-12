require "rails_helper"

describe RecipeCategory, type: :model do
  describe "validations" do
    it "is valid with recipe_id & category_id" do
      recipe = create(:recipe)
      category = create(:category)
      rc = RecipeCategory.create(recipe_id: recipe.id, category_id: category.id)

      expect(rc).to be_valid
    end
    it "is invalid without recipe_id " do
      recipe = create(:recipe)
      rc = RecipeCategory.create(recipe_id: recipe.id)

      expect(rc).to be_invalid
    end
    it "is invalid without category_id" do
      category = create(:category)
      rc = RecipeCategory.create(category_id: category.id)

      expect(rc).to be_invalid
    end
  end
  describe "relationships" do
    it {should belong_to(:recipe)}
    it {should belong_to(:category)}
  end
end
