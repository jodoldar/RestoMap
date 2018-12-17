# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Place.create!([
    {"title": "The Fitzgerald Burguer Company", "text": "Hamburgueseria", "latitude": "39.48867", "longitude": "-0.36288"},
    {"title": "Five Guys", "text": "Hamburguesería", "latitude": "39.47123", "longitude": "-0.37699"},
    {"title": "Restaurante Singular and Co", "text": "Hamburguesería", "latitude": "39.66405", "longitude": "-0.21107"}
])