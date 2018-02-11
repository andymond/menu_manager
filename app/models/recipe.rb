class Recipe < ApplicationRecord
  validates :name, :instructions, :status, presence: true
  belongs_to :user
  enum status: [ :complete, :in_progress, :for_review]
end
