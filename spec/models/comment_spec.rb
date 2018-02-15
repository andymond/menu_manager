require "rails_helper"

describe Comment, type: :model do
  describe "validations" do
    it "is valid with user & body" do
      recipe = create(:recipe)
      comment = recipe.comments.create(user: "user", body: "body")

      expect(comment).to be_valid
    end
    it "is invalid without body" do
      recipe = create(:recipe)
      comment = recipe.comments.create(user: "user")

      expect(comment).to be_invalid
    end
    it "is invalid without user" do
      recipe = create(:recipe)
      comment = recipe.comments.create(body: "body")

      expect(comment).to be_invalid
    end
  end
  describe "relationships" do
    it {should belong_to(:recipe)}
  end
end
