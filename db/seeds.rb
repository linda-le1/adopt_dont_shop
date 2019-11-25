# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
