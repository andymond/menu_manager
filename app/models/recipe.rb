class Recipe < ApplicationRecord
  validates :name, :instructions, :status, presence: true

  enum status: [ :complete, :in_progress, :for_review]
end
