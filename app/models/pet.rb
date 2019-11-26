class Pet < ApplicationRecord
  belongs_to:shelter
  validates_presence_of :image_url, :name, :description, :sex, :approximate_age
end
