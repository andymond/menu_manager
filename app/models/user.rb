class User < ApplicationRecord
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password
  has_many :recipes

  enum role: [ :default, :admin]
end
