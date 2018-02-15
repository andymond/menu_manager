class Recipe < ApplicationRecord
  validates :name, :instructions, :status, presence: true
  belongs_to :user
  has_many :recipe_categories, dependent: :destroy
  has_many :categories, through: :recipe_categories
  has_many :comments, dependent: :destroy
  enum status: [:complete, :in_progress, :for_review]
  scope :abc, -> {order(:name)}
end
