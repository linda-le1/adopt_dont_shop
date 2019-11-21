require 'rails_helper'

RSpec.describe "shelters id page", type: :feature do
  it "can hold a form to create a shelter" do

    visit "/shelters"
    expect(page).to have_link("Create New Shelter")
    click_link "Create New Shelter"
    visit '/shelters/new'

    expect(page).to have_field(shelter[name])
    expect(page).to have_field(shelter[address])
    expect(page).to have_field(shelter[city])
    expect(page).to have_field(shelter[state])
    expect(page).to have_field(shelter[zip_code])

    fill_in 'shelter[name]',    with: 'Shelter Test'
    fill_in 'shelter[address]', with: '123 Larimer Street'
    fill_in 'shelter[city]',    with: 'Denver'
    fill_in 'shelter[state]',   with: 'Colorado'
    fill_in 'shelter[zip_code]',     with: '80001'

    expect(page).to have_button("Submit")
    click_button "Submit"
    expect(response).to have_http_status(:created)
    assert_equal '/shelters', current_path
  end
end
