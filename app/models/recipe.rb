class Recipe < ApplicationRecord
  validates :name, :instructions, :status, presence: true
end
