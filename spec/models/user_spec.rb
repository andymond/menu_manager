require "rails_helper"

describe User, type: :model do
  describe "Validations" do
    it "is valid with username, email & password" do
      user = create(:user)

      expect(user).to be_valid
    end
    it "is invalid if email already exists" do
      user = create(:user)
      user_2 = User.create(username: "Larry", email: user.email, password: "12345")

      expect(user_2).to be_invalid
    end
    it "is invalid with no username" do
      user = User.create(email: "a@a.com", password: "password")

      expect(user).to be_invalid
    end
    it "is invalid with no email" do
      user = User.create(username: "argy.com", password: "password")

      expect(user).to be_invalid
    end
    it "is invalid with no password" do
      user = User.create(username: "argberg", email: "a@a.com")

      expect(user).to be_invalid
    end
  end
end
