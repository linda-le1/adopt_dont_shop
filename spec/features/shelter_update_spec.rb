require 'rails_helper'

RSpec.describe 'shelters show page', type: :feature do
  it 'can update shelter information' do

  shelter_1 = Shelter.create(name: 'Denver Animal Shelter',
                             address: '123 Colfax Ave',
                             city: 'Denver',
                             state: 'CO',
                             zip_code: '80004')

  visit "/shelters/#{shelter_1.id}"
  expect(page).to have_link('Update This Shelter')

  click_link 'Update This Shelter'
  expect(current_path).to eq "/shelters/#{shelter_1.id}/edit"

  expect(page).to have_selector('form')
  expect(page).to have_field('shelter[name]')
  expect(page).to have_field('shelter[address]')
  expect(page).to have_field('shelter[city]')
  expect(page).to have_field('shelter[state]')
  expect(page).to have_field('shelter[zip_code]')

  fill_in 'shelter[name]',      with: 'Shelter Example 1'
  fill_in 'shelter[address]',   with: '987 Colorado Boulevard'

  expect(page).to have_button('Submit')

  click_button('Submit')
  expect(current_path).to eq "/shelters/#{shelter_1.id}"
  expect(page).to have_content('Shelter Example 1')

  end
end
