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
                     start_date: Date.today,
                     end_date: Date.today + 30)
solidays.save!
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
