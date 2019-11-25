require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  it 'can create a shelter' do

    visit '/shelters'

    expect(page).to have_link('Create New Shelter')
    click_link 'Create New Shelter'

    expect(current_path).to eq '/shelters/new'

    fill_in 'name',      with: 'Shelter Test'
    fill_in 'address',   with: '123 Larimer Street'
    fill_in 'city',      with: 'Denver'
    fill_in 'state',     with: 'Colorado'
    fill_in 'zip_code',  with: '80001'
    click_button 'Submit'

    assert_equal '/shelters', current_path
  end
end
