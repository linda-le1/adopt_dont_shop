require 'rails_helper'

RSpec.describe 'as a user', type: :feature do
  it 'can delete a pet'  do

    shelter_1 = Shelter.create!(name: 'Denver Animal Shelter',
                               address: '123 Colfax Ave',
                               city: 'Denver',
                               state: 'CO',
                               zip_code: '80004')

    dog_1 = shelter_1.pets.create!(image: '/',
                       name: 'Tofu',
                       description: 'I am a neutered male, white Terrier Mix who loves to play fetch.',
                       approximate_age: 4,
                       sex: 'M',
                       shelter_name: 'Denver Animal Shelter'
                       )

    visit "pets/#{dog_1.id}"

    click_on 'Delete Pet'

    assert_equal "/pets", current_path

    expect(page).to_not have_content("Tofu")

  end
end
