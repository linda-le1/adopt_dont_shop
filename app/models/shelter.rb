class Shelter < ApplicationRecord
  has_many :pets
  validates_associated :pets
  validates_presence_of :name, :address, :city, :state, :zip_code
end
