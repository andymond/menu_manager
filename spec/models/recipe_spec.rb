require "rails_helper"

describe Recipe, type: :model do
  describe "Validations" do
    it "is valid with name, instructions, and status" do
      recipe = Recipe.create(name: "Coconut Rice", instructions: "Adjust water amount to the rice age: the newer rice needs less water. Combine water, coconut cream, sugar and salt and mix well until sugar and salt are disolved. Combine with completely rinsed and drained rice, mix thoroughly in cooker, making sure rice is level when finished mixing. Turn cooker on. When cook phase has finished and 'warm' light is on, allow rice to rest 20-30 minutes, then fluff lightly and transfer to rice warmer.", status: "complete" )

      expect(recipe).to be_valid
    end
  end
end
