require 'rails_helper'

RSpec.describe 'user delete shelter', type: :feature do
  it 'can delete an existing shelter' do

    shelter_1 = Shelter.create(name: 'Denver Animal Shelter',
                               address: '123 Colfax Ave',
                               city: 'Denver',
                               state: 'CO',
                               zip_code: '80004')

    visit "/shelters/#{shelter_1.id}"
    expect(page).to have_link('Delete This Shelter')
    click_on('Delete This Shelter')

    expect(current_path).to eq "/shelters"
  end
end
