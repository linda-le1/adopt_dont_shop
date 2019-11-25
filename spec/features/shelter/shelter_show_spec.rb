require 'rails_helper'

RSpec.describe 'Shelter show page', type: :feature do
  describe 'As a visitor' do
    before :each do

      @shelter_1 = Shelter.create(name: 'Denver Animal Shelter',
                                 address: '123 Colfax Ave',
                                 city: 'Denver',
                                 state: 'CO',
                                 zip_code: '80004')


      @dog_1 = @shelter_1.pets.create!(image: '/',
                                       name: 'Tofu',
                                       approximate_age: 4,
                                       sex: 'M',
                                       description: 'I am a neutered male, white Terrier Mix who loves to play fetch.'
                                       )

    end

    it 'can see links to shelter and pet index pages' do

      visit "/shelters/#{@shelter_1.id}"

      expect(page).to have_link('All Pets', href: "/pets")
      expect(page).to have_link('All Shelters', href: "/shelters")

    end

    it 'can see individual shelter information' do

      visit "/shelters/#{@shelter_1.id}"
      expect(page).to have_content(@shelter_1.name)
      expect(page).to have_content(@shelter_1.address)
      expect(page).to have_content(@shelter_1.city)
      expect(page).to have_content(@shelter_1.state)
      expect(page).to have_content(@shelter_1.zip_code)

    end

    it 'can see all adoptable pets at that shelter and their attributes' do

      visit "/shelters/#{@shelter_1.id}"

      expect(page).to have_link('Adoptable Pets', href:"/shelters/#{@shelter_1.id}/pets")

      click_on('Adoptable Pets')
      expect(current_path).to eq "/shelters/#{@shelter_1.id}/pets"

      expect(page).to have_content(@dog_1.image)
      expect(page).to have_content(@dog_1.name)
      expect(page).to have_content(@dog_1.approximate_age)
      expect(page).to have_content(@dog_1.sex)
      expect(page).to have_content(@dog_1.description)

    end
  end
end
