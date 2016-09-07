# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
g1 = Group.create(name: 'Axis')
g2 = Group.create(name: 'Allies')


p1 = Place.create(name: 'Maadi', longitude: 12.23, latitude: 65.5)
p2 = Place.create(name: 'Zamalek', longitude: 62.23, latitude: 105.5)
p3 = Place.create(name: 'Smart Village', longitude: 40.23, latitude: 85.5)
p4 = Place.create(name: 'New Cairo', longitude: 20.23, latitude: 45.5)