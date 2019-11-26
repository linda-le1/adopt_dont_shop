require 'rails_helper'

RSpec.describe 'as a user', type: :feature do
  describe 'After visiting a pets show page and clicking on edit that pet' do
    before :each do
      @shelter_1 = Shelter.create!(name: 'Denver Animal Shelter',
                                 address: '123 Colfax Ave',
                                 city: 'Denver',
                                 state: 'CO',
                                 zip_code: '80004')

      @dog_1 = @shelter_1.pets.create!(image: '/',
                         name: 'Tofu',
                         description: 'I am a neutered male, white Terrier Mix who loves to play fetch.',
                         approximate_age: 4,
                         sex: 'M',
                         shelter_name: 'Denver Animal Shelter'
                         )

    end

    it 'can see links to the pets and shelters index pages' do

      visit "/shelters/#{@shelter_1.id}/pets/"

      expect(page).to have_link('All Pets', href: '/pets')
      expect(page).to have_link('All Shelters', href: '/shelters')

    end

    it 'can see each pet that can be adopted from that shelter id and its attributes'  do

      visit "/shelters/#{@shelter_1.id}/pets/"

      expect(page).to have_content(@dog_1.image)
      expect(page).to have_content(@dog_1.name)
      expect(page).to have_content(@dog_1.description)
      expect(page).to have_content(@dog_1.approximate_age)
      expect(page).to have_content(@dog_1.sex)
      expect(page).to have_content("Adoptable")

    end

    it 'can see a link to add a new adoptable pet for that shelter'  do

      visit "/shelters/#{@shelter_1.id}/pets"

      click_on('Add New Pet for Adoption')

      assert_equal "/shelters/#{@shelter_1.id}/pets/new", current_path
    end
  end 
end
