require 'rails_helper'

RSpec.describe 'shelters id page', type: :feature do
  it 'can hold a form to create a shelter' do

    visit '/shelters'

    expect(page).to have_link('Create New Shelter')
    click_link 'Create New Shelter'

    expect(current_path).to eq '/shelters/new'

    expect(page).to have_selector('form')
  end

  it 'can take and submit information in the form' do

    visit '/shelters/new'

    fill_in 'name',      with: 'Shelter Test'
    fill_in 'address',   with: '123 Larimer Street'
    fill_in 'city',      with: 'Denver'
    fill_in 'state',     with: 'Colorado'
    fill_in 'zip_code',  with: '80001'
    click_button 'Submit'

    assert_equal '/shelters', current_path
  end
end
