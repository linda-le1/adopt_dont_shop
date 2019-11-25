require 'rails_helper'

RSpec.describe 'shelters show page', type: :feature do

  before :each do

    @shelter_1 = Shelter.create(name: 'Denver Animal Shelter',
                               address: '123 Colfax Ave',
                               city: 'Denver',
                               state: 'CO',
                               zip_code: '80004')

  end

  it 'can hold links to shelter and pet index pages' do

    visit "/shelters/#{@shelter_1.id}"

    expect(page).to have_link('All Pets', href: "/pets")
    expect(page).to have_link('All Shelters', href: "/shelters")

  end

  it 'can see individual shelter information including adoptable pets' do

    visit "/shelters/#{@shelter_1.id}"

    expect(page).to have_link('Adoptable Pets', href:"/shelters/#{@shelter_1.id}/pets")

    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_1.address)
    expect(page).to have_content(@shelter_1.city)
    expect(page).to have_content(@shelter_1.state)
    expect(page).to have_content(@shelter_1.zip_code)

  end
end
