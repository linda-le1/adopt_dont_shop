require 'rails_helper'

RSpec.describe 'pets index page', type: :feature do
  it 'can see all pets' do
    tofu = Pet.create!(image: '/',
                       name: 'Tofu',
                       approximate_age: 4,
                       sex: 'M',
                       shelter_name: 'Denver Animal Shelter'
                       )
