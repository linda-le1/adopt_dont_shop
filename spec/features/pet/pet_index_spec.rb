require 'rails_helper'

RSpec.describe 'pets index page', type: :feature do
  it 'can see all pets' do
    tofu = Pet.create!(image: '/',
                       name: 'Tofu',
                       approximate_age: 4,
                       sex: 'M',
                       shelter_name: 'Denver Animal Shelter'
                       )

    visit '/pets'

    expect(page).to have_content(tofu.image)
    expect(page).to have_content(tofu.name)
    expect(page).to have_content(tofu.approximate_age)
    expect(page).to have_content(tofu.sex)
    expect(page).to have_content(tofu.shelter_name)
  end
end
