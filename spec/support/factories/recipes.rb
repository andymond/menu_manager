FactoryBot.define do
  factory :recipe do
    sequence(:name) {|n| "RecipeName#{n}"}
    sequence(:instructions) {|n| "RecipeInstructions#{n}"}
    user
  end
end
