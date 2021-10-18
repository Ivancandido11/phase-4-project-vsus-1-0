# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Seeding ..."

User.create(username: "Zasd", password_digest: "1234", email: "Zasd@gmail.com")
User.create(username: "Moca", password_digest: "1234", email: "Moca@gmail.com")
User.create(username: "Traxcin", password_digest: "1234", email: "Traxcin@gmail.com")
User.create(username: "Backpack", password_digest: "1234", email: "Backpack@gmail.com")
User.create(username: "Samoorye", password_digest: "1234", email: "Samoorye@gmail.com")
User.create(username: "Socks", password_digest: "1234", email: "Socks@gmail.com")

puts "Seeding done!"
