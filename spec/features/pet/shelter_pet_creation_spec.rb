require 'rails_helper'

RSpec.describe 'as a user', type: :feature do
  it 'can add a new adoptable pet to that shelter'  do

    shelter_1 = Shelter.create!(name: 'Denver Animal Shelter',
                               address: '123 Colfax Ave',
                               city: 'Denver',
                               state: 'CO',
                               zip_code: '80004')

    visit "/shelters/#{shelter_1.id}/pets"
    expect(page).to have_link('All Pets', href: "/pets")
    click_on('Add New Pet for Adoption')
    assert_equal "/shelters/#{shelter_1.id}/pets/new", current_path

    fill_in 'image',      with: 'test_url'
    fill_in 'name',   with: 'Kumo'
    fill_in 'description',      with: 'Active Shiba Inu who enjoys long walks.'
    fill_in 'approximate_age',     with: 2
    fill_in 'sex',  with: 'Male'
    click_button 'Submit'

    assert_equal "/shelters/#{shelter_1.id}/pets", current_path
    expect(page).to have_content('Kumo')
    expect(page).to have_content('Active Shiba Inu who enjoys long walks.')
    expect(page).to have_content(2)
    expect(page).to have_content('Male')
    expect(page).to have_content ('Adoptable')

  end
end
