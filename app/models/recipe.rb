class Recipe < ApplicationRecord
  validates :name, :instructions, :status, presence: true
  belongs_to :user
  has_many :recipe_categories, dependent: :destroy
  has_many :categories, through: :recipe_categories
  enum status: [:complete, :in_progress, :for_review]
  scope :abc, -> {order(:name)}
end
