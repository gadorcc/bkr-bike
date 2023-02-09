# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
puts "Cleaning up database..."
Bike.destroy_all
User.destroy_all
puts "Database cleaned"
i = 0
User.create!(
  email: "test@test.com",
  password: "123456",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  postcode: Faker::Address.postcode,
)
10.times do
  i += 1
  puts "creating user number #{i}"
  User.create!(
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    postcode: Faker::Address.postcode,
 )
end
users = User.all
i = 0
users.each do |user|
  i += 1
  puts "creating bike number #{i}"
  Bike.create!(
    title: ["Amazing dirty bike", "Cool reliable biky picky","Bike me baby", "Colourful tiny bike"].sample,
    description: ["This bike is light, stiff, and comfortable. But you don’t need to scale step climbs to feel the Ultimate’s trademark performance. Experience pure freedom from the first turn of the crank.", "With fast wheels, comfortable tyres, pinpoint handling and long-distance geometry, this bike delivers control comfort and speed in equal measure. A great place to be for long rides, even on the roughest roads"].sample,
    bike_type: %w[electric road mountain folding kids hybrid city trike].sample,
    price: rand(5..45),
    user_id: user.id
  )
  # bike.image.attach(io: Fileopen(Rails.root.join("/app/assets/images/sample.gif")), filename: "sample.gif")
end
