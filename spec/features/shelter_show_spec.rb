require 'rails_helper'

<<<<<<< HEAD
RSpec.describe "shelters id page", type: :feature do
  it "can see shelter with id and other attributes" do
=======
RSpec.describe 'shelters id page', type: :feature do
  it 'can see shelter with id and other attributes' do
>>>>>>> 4c6573021ef02aba8c23c054d41b569980b08671

    shelter_1 = Shelter.create(name: 'Denver Animal Shelter',
                               address: '123 Colfax Ave',
                               city: 'Denver',
                               state: 'CO',
                               zip_code: '80004')

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip_code)
  end
end
  
