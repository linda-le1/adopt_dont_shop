require 'rails_helper'

RSpec.describe 'Shelter index page', type: :feature do
  describe 'As a visitor' do
    before :each do

      @shelter_1 = Shelter.create!(name: 'Denver Animal Shelter')
      @shelter_2 = Shelter.create!(name: 'Colorado Shiba Inu Rescue')

   end

    it 'can see the name of each shelter in the system' do

      visit '/shelters'

      expect(page).to have_content(@shelter_1.name)
      expect(page).to have_content(@shelter_2.name)
    end

    it 'can see links to shelter id pages for all shelters listed' do

      visit '/shelters'

      expect(page).to have_link('Denver Animal Shelter', href: "/shelters/#{@shelter_1.id}")
      expect(page).to have_link('Colorado Shiba Inu Rescue', href: "/shelters/#{@shelter_2.id}")

    end

    it 'can see links at top of page that go to pet and shelter indexes' do

      visit '/shelters'

      expect(page).to have_link('All Pets', href: '/pets')
      expect(page).to have_link('All Shelters', href: '/shelters')

    end

    it 'can see link to create new shelter' do

      visit '/shelters'

      expect(page).to have_link('Create New Shelter')
      assert_equal '/shelters/new', current_path

    end

    it 'can see links to edit and delete shelters' do

      visit '/shelters'

      expect(page).to have_link('Edit This Shelter', href: "/shelters/#{@shelter_1.id}/edit")
      expect(page).to have_link('Delete This Shelter', href: "/shelters/#{@shelter_1.id}")

      expect(page).to have_link('Edit This Shelter', href: "/shelters/#{@shelter_2.id}/edit")
      expect(page).to have_link('Delete This Shelter', href: "/shelters/#{@shelter_2.id}")
    end
  end
end
