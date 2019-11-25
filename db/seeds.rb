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

shelter_2 = Shelter.create!(name: 'Colorado Shiba Inu Rescue',
                            address: '777 Colorado Blvd',
                            city: 'Denver',
                            state: 'CO',
                            zip_code: '80012')

shelter_1.pets.create!(image: '/',
                       name: 'Tofu',
                       description: 'I am a neutered male, white Terrier Mix who loves to play fetch.',
                       approximate_age: 4,
                       sex: 'M',
                       shelter_name: 'Denver Animal Shelter'
                       )
shelter_1.pets.create!(image: '/',
                        name: 'Kumo',
                        description: 'I am a neutered male, black Shiba Inu who loves to go on hikes.',
                        approximate_age: 2,
                        sex: 'M',
                        shelter_name: 'Denver Animal Shelter'
                      )
shelter_2.pets.create!(image: '/',
                        name: 'Kiku',
                        description: 'I am a spayed female, cream Shiba Inu who loves to play fetch.',
                        approximate_age: 5,
                        sex: 'F',
                        shelter_name: 'Colorado Shiba Inu Rescue'
                        )
