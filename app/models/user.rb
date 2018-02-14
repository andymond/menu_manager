class User < ApplicationRecord
  validates :email, :username, presence: true, uniqueness: true
  has_secure_password
  has_many :recipes, dependent: :destroy
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  enum role: [:default, :admin]
end
