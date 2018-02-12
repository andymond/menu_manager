require "rails_helper"

describe Recipe, type: :model do
  describe "validations" do
    describe "valid attributes" do
      it "is valid with name, instructions, and status" do
        recipe = create(:recipe)

        expect(recipe).to be_valid
      end
    end

    describe "invalid attributes" do
      it "is invalid without name" do
        recipe = Recipe.create(instructions: "Adjust water amount to the rice age: the newer rice needs less water. Combine water, coconut cream, sugar and salt and mix well until sugar and salt are disolved. Combine with completely rinsed and drained rice, mix thoroughly in cooker, making sure rice is level when finished mixing. Turn cooker on. When cook phase has finished and 'warm' light is on, allow rice to rest 20-30 minutes, then fluff lightly and transfer to rice warmer.", status: "complete" )

        expect(recipe).to be_invalid
      end
      it "is invalid without instructions" do
        recipe = Recipe.create(name: "Coconut Rice", status: "complete" )

        expect(recipe).to be_invalid
      end
    end
  end
  describe "relationships" do
    it {should belong_to(:user)}
    it {should have_many(:recipe_categories)}
    it {should have_many(:categories)}
  end
end
