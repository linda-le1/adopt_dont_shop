require 'rails_helper'

RSpec.describe 'shelters id page', type: :feature do
  it 'can hold a form to create a shelter' do

    visit '/shelters'

    expect(page).to have_link('Create New Shelter')
    click_link 'Create New Shelter'

    expect(current_path).to eq '/shelters/new'

    expect(page).to have_selector('form')
    expect(page).to have_field('shelter[name]') #just fill in instead of have_field
    expect(page).to have_field('shelter[address]') #no response test because only care about user interaction 
    expect(page).to have_field('shelter[city]')
    expect(page).to have_field('shelter[state]')
    expect(page).to have_field('shelter[zip_code]')

  end

  it 'can take and submit information in the form' do

    visit '/shelters/new'

    fill_in 'shelter[name]',      with: 'Shelter Test'
    fill_in 'shelter[address]',   with: '123 Larimer Street'
    fill_in 'shelter[city]',      with: 'Denver'
    fill_in 'shelter[state]',     with: 'Colorado'
    fill_in 'shelter[zip_code]',  with: '80001'

    expect(page).to have_button('Submit')
    click_button 'Submit'

    assert_equal '/shelters', current_path
  end
end
