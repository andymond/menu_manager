require "rails_helper"

describe Comment, type: :model do
  describe "validations" do
    it "is valid with user & body" do
      comment = Comment.create(user: "user", body: "body")

      expect(comment).to be_valid
    end
    it "is invalid without body" do
      comment = Comment.create(user: "user")

      expect(comment).to be_invalid
    end
    it "is invalid without user" do
      comment = Comment.create(body: "body")

      expect(comment).to be_invalid
    end
  end
end
