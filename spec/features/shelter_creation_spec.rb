require 'rails_helper'

RSpec.describe "shelters id page", type: :feature do
  it "can fill out a form and create a shelter" do

    visit "/shelters"

    expect(page).to have_field(shelter[name])

    Then I see a link to create a new Shelter
    When I click this link

    visit '/shelters/new'
    Then I am taken to '/shelters/new' where I  see a form for a new shelter

    When I fill out the form with a new shelter's:
    - name
    - address
    - city
    - state
    - zip

    And I click the button to submit the form
    Then a `POST` request is sent to '/shelters',
    a new shelter is created,
    and I am redirected to the Shelter Index page where I see the new Shelter listed.
