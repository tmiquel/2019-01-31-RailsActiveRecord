# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Effacement de toutes les bases de données'
puts '-' * 50
puts
City.delete_all
DogSitter.delete_all
Dog.delete_all
Stroll.delete_all

puts
puts '-' * 50
puts 'Création de 10 villes, Dogs et DogSitter supplementaires...'
puts '-' * 50
puts

10.times do
  City.create(city_name: Faker::Address.city)
end

10.times do
  offset = rand(City.count)
  DogSitter.create(first_name: Faker::Name.first_name,
                   city: City.offset(offset).first)
  Dog.create(first_name: Faker::Dog.name,
             city: City.offset(offset).first)
end

puts
puts '-' * 50
puts '10 Dogs, Dog_sitter et villes supplémentaires ont été crées'
puts 'Création de 10 Strolls supplémentaires...'
puts '-' * 50
puts

10.times do
  offset_city = rand(City.count)
  offset = rand(DogSitter.count)
  offset_Dog = rand(Dog.count)
  Stroll.create(dog_sitter: DogSitter.offset(offset).first,
                dog: Dog.offset(offset_Dog).first,
                date: Faker::Date.between(30.days.ago, Date.today),
                city: City.offset(offset_city).first)
end

puts
puts '-' * 50
puts '10 Strolls crées'
puts '-' * 50
puts

puts '=' * 50
puts 'Impression des 3 derniers items de chaque table'
puts '=' * 50
puts
puts 'dosgitters'
tp DogSitter.last(3)
puts
puts 'Dogs'
tp Dog.last(3)
puts
puts 'Villes'
tp City.last(3)
puts
puts 'Strolls'
tp Stroll.last(3)
puts

puts 'END'
