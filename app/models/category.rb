class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :recipe_categories, dependent: :destroy
  has_many :recipes, through: :recipe_categories
  scope :abc, -> {order(:name)}
end
