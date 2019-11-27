class Pet < ApplicationRecord
  belongs_to:shelter
  validates :shelter, presence: true
  validates :image_url, presence: true
  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "Pet names can only inlude letters"}
  validates :description, presence: true
  validates :sex, presence: true
  validates :approximate_age, presence: true, numericality: { only_integer: true }
end
