require 'rails_helper'

RSpec.describe 'pets id page', type: :feature do
  it 'can see attributes and adoption status of specific pet' do
    dog = Pet.create!(image: '/',
                       name: 'Tofu',
                       approximate_age: 4,
                       sex: 'M',
                       shelter_name: 'Denver Animal Shelter',
                       is_adoptable: true
                       )

     visit "/pets/#{dog.id}"

     expect(page).to have_content(dog.image)
     expect(page).to have_content(dog.name)
     expect(page).to have_content(dog.approximate_age)
     expect(page).to have_content(dog.shelter_name)
     expect(page).to have_content(dog.is_adoptable)
  end
end
