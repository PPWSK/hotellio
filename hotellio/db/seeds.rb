# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Accommodation.create(title: "italy", description: "jesus born", price: "220", type: "entire flat/house", guest_number:"3")
Accommodation.create(title: "london", description: "beautifull view", price: "500", type: "private room", guest_number:"5")
Accommodation.create(title: "new-york", description: "beautifull place", price: "215", type: "private room", guest_number:"6")
Accommodation.create(title: "brussels", description: "Place to be", price: "50", type: "shared room", guest_number:"7")
Accommodation.create(title: "japan", description: "i don't know", price: "154", type: "private room", guest_number:"1")
Accommodation.create(title: "Vietnam", description: "zsvedgsdfwgqbv", price: "458", type: "shared room", guest_number:"12")
Accommodation.create(title: "Wagon", description: "Finally", price: "12", type: "private room", guest_number:"6", location: "5 Place Sainte-Gudule 1000 Bruxelles")
