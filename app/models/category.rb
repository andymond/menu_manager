class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :recipe_categories
  has_many :recipes, through: :recipe_categories
end
