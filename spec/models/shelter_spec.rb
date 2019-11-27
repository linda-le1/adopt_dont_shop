require 'rails_helper'

describe Shelter, type: :model do
  before :each do

    @shelter_1 = Shelter.create(name: 'Denver Animal Shelter',
                               address: '123 Colfax Ave',
                               city: 'Denver',
                               state: 'CO',
                               zip_code: '80004')


    @dog_1 = @shelter_1.pets.create!(image_url: '/',
                                     name: 'Tofu',
                                     approximate_age: 4,
                                     sex: 'M',
                                     description: 'I am a neutered male, white Terrier Mix who loves to play fetch.'
                                     )
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :address}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}

    it {should validate_presence_of :zip_code}
    it { should validate_length_of(:zip_code).is_equal_to(5) }
  end

  describe 'relationships' do
    it {should have_many :pets}
  end

  describe 'methods'do
  it ".count_pets" do
    expect(@shelter_1.count_pets).to eq 1
  end
end

end
