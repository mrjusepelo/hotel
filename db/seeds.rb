# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


room_prices = [50,75,100]

for i in 1..10 do
  for j in 1..20 do
    Room.create(name: "#{j}0#{i}", price: room_prices.sample)
    Faker::Name.name
  end
  User.create(name: Faker::Name.name, member_level: rand(1..5))

  puts "=====Cargando %#{(((i).to_f/10)*100).round(2)}"
end
