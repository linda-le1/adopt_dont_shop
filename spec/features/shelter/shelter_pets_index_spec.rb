require 'rails_helper'

RSpec.describe 'pets id page', type: :feature do
  it 'can see which pets can be adopted from a shelter and their attributes'  do

    shelter_1 = Shelter.create!(name: 'Denver Animal Shelter',
                               address: '123 Colfax Ave',
                               city: 'Denver',
                               state: 'CO',
                               zip_code: '80004')

    dog = Pet.create!(image: '/',
                       name: 'Tofu',
                       approximate_age: 4,
                       sex: 'M',
                       shelter_name: 'Denver Animal Shelter'
                       )

     visit "/shelters/#{shelter_1.id}/pets"

     expect(page).to have_content(dog.image)
     expect(page).to have_content(dog.name)
     expect(page).to have_content(dog.approximate_age)
     expect(page).to have_content(dog.sex)
  end
end
