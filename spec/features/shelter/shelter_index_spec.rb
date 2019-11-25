require 'rails_helper'

RSpec.describe 'shelters index page', type: :feature do
  it 'can see all shelters' do
    shelter_1 = Shelter.create!(name: 'Denver Animal Shelter')
    shelter_2 = Shelter.create!(name: 'Colorado Shiba Inu Rescue')

    visit '/shelters'
    expect(page).to have_link('All Pets', href: "/pets")
    expect(page).to have_link('All Shelters', href: "/shelters")

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_link('Edit This Shelter', href: "/shelters/#{shelter_1.id}/edit")
    expect(page).to have_link('Delete This Shelter', href: "/shelters/#{shelter_1.id}")
    expect(page).to have_content(shelter_2.name)
    expect(page).to have_link('Edit This Shelter', href: "/shelters/#{shelter_2.id}/edit")
    expect(page).to have_link('Delete This Shelter', href: "/shelters/#{shelter_2.id}")
    expect(page).to have_link('Denver Animal Shelter', href: "/shelters/#{shelter_1.id}")
  end
end
