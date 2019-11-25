require 'rails_helper'

RSpec.describe 'shelters index page', type: :feature do
  it 'can see all shelters' do
    shelter_1 = Shelter.create!(name: 'Denver Animal Shelter')
    shelter_2 = Shelter.create!(name: 'Colorado Shiba Inu Rescue')

    visit '/shelters'

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_link('Edit This Shelter', href: "/shelters/#{shelter_1.id}/edit")
    expect(page).to have_content(shelter_2.name)
    expect(page).to have_link('Edit This Shelter', href: "/shelters/#{shelter_2.id}/edit")
  end
end
