require "open-uri"
puts "Destroying..."
User.destroy_all
Event.destroy_all
Reward.destroy_all
puts "User : #{User.all.length}"
puts "Event : #{Event.all.length}"
puts "Reward : #{Reward.all.length}"
puts "---------------------------------------"
puts "Creating Users"
toto = User.new(first_name: "Toto",
                last_name: "TOTO",
                email: "toto@mail.com",
                password: "password",
                city: "Paris")
toto.save!
bob = User.new(first_name: "Bob",
               last_name: "BOB",
               email: "bob@mail.com",
               password: "password",
               city: "Paris")
bob.save!
puts "Users created : #{User.count}"
puts "---------------------------------------"
puts "Creating Events"

solidays = Event.new(
  title: "Solidays",
  category: "Festival de musique",
  tags: "",
  address: "2 Rte des Tribunes, 75016 Paris",
  description: "Solidays est un festival de musique organisé par l'association Solidarité sida.
                Depuis 1999, il rassemble, sur les pelouses de l'hippodrome de Longchamp, à Paris,
                des artistes, conférenciers, militants et festivaliers.",
  start_date: DateTime.now - 1.day,
  end_date: DateTime.now - 20.hours
)
solidays.save!

welove = Event.new(
  title: "Welove",
  category: "Festival de musique",
  tags: "",
  address: "2 Rte des Tribunes, 75016 Paris",
  description: "Solidays est un festival de musique organisé par l'association Solidarité sida.
                Depuis 1999, il rassemble, sur les pelouses de l'hippodrome de Longchamp, à Paris,
                des artistes, conférenciers, militants et festivaliers.",
  start_date: DateTime.now - 2.hours,
  end_date: DateTime.now + 2.hours
)
welove.save!

rockenseine = Event.new(
  title: "Rock En Seine",
  category: "Festival de musique",
  tags: "",
  address: "2 Rte des Tribunes, 75016 Paris",
  description: "Solidays est un festival de musique organisé par l'association Solidarité sida.
                Depuis 1999, il rassemble, sur les pelouses de l'hippodrome de Longchamp, à Paris,
                des artistes, conférenciers, militants et festivaliers.",
  start_date: DateTime.now + 1.day,
  end_date: DateTime.now + 3.days
)
rockenseine.save!

puts "Events created : #{Event.count}"
puts "---------------------------------------"
puts "Creating Participations"

Participation.create!(
  hint: "coiffe indienne",
  user: toto,
  event: solidays
)
Participation.create!(
  hint: "coiffe indienne",
  user: toto,
  event: welove
)
Participation.create!(
  hint: "coiffe indienne",
  user: toto,
  event: rockenseine
)
Participation.create!(
  hint: "chapeau de cowboy",
  user: bob,
  event: solidays
)
puts "Participations created : #{Participation.count}"
puts "---------------------------------------"
