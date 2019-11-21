require 'rails_helper'

RSpec.describe 'shelters index page', type: :feature do
  it 'can see all shelters' do
    shelter_1 = Shelter.create(name: 'Denver Animal Shelter')

    visit '/shelters'

    expect(page).to have_content(shelter_1.name)
  end
end
