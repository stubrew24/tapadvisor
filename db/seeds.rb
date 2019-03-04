# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Taproom.destroy_all

user1 = User.create(name: "Stuart Sewell", email: "sewelly@gmail.com", password: "simpsons", password_confirmation: "simpsons")
user2 = User.create(name: "Jana Garina", email: "j.garina@gmail.com", password: "simpsons", password_confirmation: "simpsons")
user3 = User.create(name: "Mark Sandberg", email: "sandbadger256@gmail.com", password: "simpsons", password_confirmation: "simpsons")

taproom1 = Taproom.create(brewery: "Cloudwater", location: "73 Enid Street", opening_times: "Weds-Sun 15:00 - 22:00", bio: "Our London tap room, 73 Enid Street, is nestled in a railway arch in Bermondsey.")
taproom1 = Taproom.create(brewery: "BBNo Peckham", location: "Arches 1+2 Bellenden Business Park", opening_times: "Fri 5pm-10.30pm, Sat 12pm-10.30pm, Sun 12pm-8pm", bio: "BBNO Barrel Store Peckham")
taproom1 = Taproom.create(brewery: "Fourpure", location: "Bermondsey Trading Estate SE16 ", opening_times: "Tues-Sun 12:00 - 20:00", bio: "As you wander into the industrial style bar you find yourself right in the heart of the action, confronted with the delightful aroma of hops, malt, and freshly brewed wort. ")
