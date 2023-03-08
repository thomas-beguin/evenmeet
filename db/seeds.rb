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

solidays = Event.new(title: "Solidays",
                     category: "Festival de musique",
                     tags: "",
                     address: "2 Rte des Tribunes, 75016 Paris",
                     description: "Solidays est un festival de musique organisé par l'association Solidarité sida.
                                   Depuis 1999, il rassemble, sur les pelouses de l'hippodrome de Longchamp, à Paris,
                                   des artistes, conférenciers, militants et festivaliers.",
                     start_date: DateTime.now + 30,
                     end_date: DateTime.now + 32)
solidays.save!

delta_festival = Event.new(title: "Delta Festival",
  category: "Festival de musique",
  tags: "",
  address: "50 Rue de l'Ourcq, 75019 Paris",
  description: "Le Delta Festival est un festival bidon issu de l'imagination de Louis Sebag.",
  start_date: DateTime.now + 45,
  end_date: DateTime.now + 47)
delta_festival.save!

puts "Events created : #{Event.count}"
puts "---------------------------------------"
puts "Creating Participations"
toto_par = Participation.new(hint: "coiffe indienne")
toto_par.user = toto
toto_par.event = solidays
toto_par.save!
bob_par = Participation.new(hint: "chapeau de cowboy")
bob_par.user = bob
bob_par.event = solidays
bob_par.save!
puts "Participations created : #{Participation.count}"
puts "---------------------------------------"
