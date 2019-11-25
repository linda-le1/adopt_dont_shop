require 'rails_helper'

RSpec.describe 'pets index page', type: :feature do
  it 'can see all pets' do

    shelter_1 = Shelter.create!(name: 'Denver Animal Shelter',
                               address: '123 Colfax Ave',
                               city: 'Denver',
                               state: 'CO',
                               zip_code: '80004')

    dog_1 = shelter_1.pets.create!(image: '/',
                       name: 'Tofu',
                       approximate_age: 4,
                       sex: 'M',
                       shelter_name: 'Denver Animal Shelter'
                       )

    visit '/pets'

    expect(page).to have_content(dog_1.image)
    expect(page).to have_content(dog_1.name)
    expect(page).to have_content(dog_1.approximate_age)
    expect(page).to have_content(dog_1.sex)
    expect(page).to have_content(dog_1.shelter_name)

    expect(page).to have_link('Edit Pet', href: "/pets/#{dog_1.id}/edit")
    expect(page).to have_link('Delete Pet', href: "/pets/#{dog_1.id}")
    

  end
end
