class User < ApplicationRecord
  has_many :entries
  has_many :appointments
  has_secure_password

  # Validations
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true
  validates :password, presence: true
end
