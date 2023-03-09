require "open-uri"
require 'faker'

puts "Destroying..."
User.destroy_all
Event.destroy_all
Reward.destroy_all
puts "User : #{User.all.length}"
puts "Event : #{Event.all.length}"
puts "Reward : #{Reward.all.length}"

puts "---------------------------------------"
puts "Creating Users"

mickael = User.new(first_name: "Mickael",
                last_name: "SIGMAR",
                email: "mickael@mail.com",
                password: "password",
                city: "Paris")
mickael.photos.attach(io: URI.open("https://images.unsplash.com/photo-1500210701147-9eaeb52f32ac?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"), filename: "seed.png", content_type: "image/png")
mickael.save!

puts "Mickael created"

robert = User.new(first_name: "Robert",
               last_name: "BOUBLARD",
               email: "robert@mail.com",
               password: "password",
               city: "Paris")
robert.photos.attach(io: URI.open("https://images.unsplash.com/photo-1623082574085-157d955f1d35?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"), filename: "seed.png", content_type: "image/png")
robert.save!

puts "Robert created"

jessica = User.new(first_name: "Jessica",
  last_name: "CHASTAIN",
  email: "jessica@mail.com",
  password: "password",
  city: "Paris")
jessica.photos.attach(io: URI.open("https://images.unsplash.com/photo-1570053381569-78f606b5caab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2831&q=80"), filename: "seed.png", content_type: "image/png")
jessica.save!

puts "Jessica created"

hugo = User.new(first_name: "Hugo",
  last_name: "POUSSIN",
  email: "hugo@mail.com",
  password: "password",
  city: "Evry")
hugo.photos.attach(io: URI.open("https://images.unsplash.com/photo-1567784177951-6fa58317e16b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"), filename: "seed.png", content_type: "image/png")
hugo.save!

puts "Hugo created"

melanie = User.new(first_name: "Mélanie",
  last_name: "PICHARD",
  email: "melanie@mail.com",
  password: "password",
  city: "Evry")
melanie.photos.attach(io: URI.open("https://images.unsplash.com/photo-1565104479617-751892dc290e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3387&q=80"), filename: "seed.png", content_type: "image/png")
melanie.save!

puts "Melanie created"
puts "All demo users created"
# puts "Creating 15 additional users"
# 8.times do
#   user = User.new(first_name: Faker::Name.male_first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     password: "password",
#     city: "Paris")
#   user.photos.attach(io: URI.open("https://images.unsplash.com/photo-1623082574085-157d955f1d35?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"), filename: "seed.png", content_type: "image/png")
#   user.save!
#   puts "#{user.first_name} created"
# end

# 7.times do
#   user = User.new(first_name: Faker::Name.female_first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     password: "password",
#     city: "Paris")
#   user.photos.attach(io: URI.open("https://images.unsplash.com/photo-1570053381569-78f606b5caab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2831&q=80"), filename: "seed.png", content_type: "image/png")
#   user.save!
#   puts "#{user.first_name} created"
# end

puts "Users created : #{User.count}"

puts "---------------------------------------"
puts "Creating Events"

solidays = Event.new(
  title: "Solidays",
  category: "Music festival",
  tags: "",
  address: "2 Rte des Tribunes, 75016 Paris",
  description: "Once again this year, the Hippodrome Longchamps in Paris will welcome thousands of festival-goers to celebrate the start of summer with music. Although the line-up is still confidential, there is no doubt that 2023 will once again live up to the expectations of festival-goers. PLK, Macklemore, Angèle, J Balvin and Stromae have already been headlining the festival.",
  start_date: DateTime.now - 1.day,
  end_date: DateTime.now - 20.hours
)
solidays.photos.attach(io: URI.open("https://statics-infoconcert.digitick.com/media/a_effacer/solidays_resa-pass3j_visunews0123.jpg"), filename: "seed.png", content_type: "image/png")
solidays.save!

lollapalooza = Event.new(
  title: "Lollapalooza Paris",
  category: "Music festival",
  tags: "",
  address: "5 Rue de Lagny, 75020 Paris",
  description: "A few weeks after Solidays, it’s Lolapalooza’s turn to bring together music lovers at the Hippodrome Longchamps. And for the occasion, the festival has kicked things up a notch: Kendrick Lamar, Rosalia, Lil Nas X, Aya Nakamura and Damso are verified as headliners for the 2023 edition.",
  start_date: DateTime.now - 2.hours,
  end_date: DateTime.now + 2.hours
)
lollapalooza.photos.attach(io: URI.open("https://global-uploads.webflow.com/616ee9a6ca0a92c43c8929b6/63d0f1b632a91dddc41688ce_onimage.jpg"), filename: "seed.png", content_type: "image/png")
lollapalooza.save!

# francofolies = Event.new(
#   title: "Francofolies de La Rochelle",
#   category: "Music festival",
#   tags: "",
#   address: "14 Bd Maréchal Lyautey, 17000 La Rochelle",
#   description: "Some of the artists who will grace Francofolies festival-goers have already been announced. M, Lomepal, Gazo, Soprano, Chilla, Michel Polnareff or Matmatah are expected in La Rochelle this summer.",
#   start_date: DateTime.now - 8.days,
#   end_date: DateTime.now - 7.days
# )
# francofolies.photos.attach(io: URI.open("https://agendaculturel.emstorage.fr/francofolies-20221124110139.png"), filename: "seed.png", content_type: "image/png")
# francofolies.save!

# rockenseine = Event.new(
#   title: "Rock en Seine",
#   category: "Music festival",
#   tags: "",
#   address: "2 Rue Cauchy, 75015 Paris",
#   description: "The most rock’n’roll of Paris festivals is back for an anniversary edition. 2023 will mark the 20th anniversary of Rock en Seine. This means we can expect an exceptional line-up for this event which has already brought in Arctic Monkeys, Stromae, The Blaze, Yungblud and IDLES. The programme will be unveiled in January.",
#   start_date: DateTime.now + 10.days,
#   end_date: DateTime.now + 13.days
# )
# rockenseine.photos.attach(io: URI.open("https://www.rockenseine.com/wp-content/uploads/2021/12/RES22_DOUBLE-RATM-COVERS-RS_banniere-FB-1920x1080-1.jpg"), filename: "seed.png", content_type: "image/png")
# rockenseine.save!

# mainsquare = Event.new(
#   title: "Main Square Festival",
#   category: "Music festival",
#   tags: "",
#   address: "6 Pl. Guy Mollet, 62022 Arras",
#   description: "The Arras music festival is set to deliver an epic 2023 edition. While the rest of the line-up has yet to be revealed, music fans can already look forward to live performances from Aya Nakamura, Orelsan, David Guetta, Macklemore and American band Maroon 5.",
#   start_date: DateTime.now + 18.days,
#   end_date: DateTime.now + 20.days
# )
# mainsquare.photos.attach(io: URI.open("https://generation.hautsdefrance.fr/wp-content/uploads/2022/06/MAINSQUAREFESTIVAL2022_GENERIQUE_1200x630.jpg"), filename: "seed.png", content_type: "image/png")
# mainsquare.save!

# hellfest = Event.new(
#   title: "Hellfest",
#   category: "Music festival",
#   tags: "",
#   address: "1 Les Grands Champs, 44190 Clisson",
#   description: "For its 16th edition, Hellfest returns with a line-up that will delight all rock and metal fans. Over the span of four days, the village of Clisson, in the Loire-Atlantique region, will welcome the biggest names in the genre: Iron Maiden, KISS, SlipKnot, Sum41, Machine Gun Kelly and Pantera.",
#   start_date: DateTime.now + 21.days,
#   end_date: DateTime.now + 23.days
# )
# hellfest.photos.attach(io: URI.open("https://generation.hautsdefrance.fr/wp-content/uploads/2022/06/MAINSQUAREFESTIVAL2022_GENERIQUE_1200x630.jpg"), filename: "seed.png", content_type: "image/png")
# hellfest.save!

# delta = Event.new(
#   title: "Delta Festival",
#   category: "Music festival",
#   tags: "",
#   address: "9 Quai du Lazaret, 13002 Marseille",
#   description: "Every summer, the Prado beach in Marseille hosts one of the biggest festivals in France: Delta. We still don’t know the names of the artists on the bill for this edition. With five stages and regulars such as Big Flo & Oli, PNL, Kungs and Vitalic, the festival offers a rich and varied programme every year.",
#   start_date: DateTime.now + 1.day,
#   end_date: DateTime.now + 3.days
# )
# delta.photos.attach(io: URI.open("https://images.bfmtv.com/owqG4OKlNTDmFADP6vv3xTor9U0=/30x2:1966x1091/1936x0/images/Delta-Festival-2022-1228406.jpg"), filename: "seed.png", content_type: "image/png")
# delta.save!

# vieillescharrues = Event.new(
#   title: "Vieilles Charrues",
#   category: "Music festival",
#   tags: "",
#   address: "Rue Jean-Sébastien Corvellec, 29270 Carhaix-Plouguer",
#   description: "The 31st edition of Les Veilles Charrues will bring together internationally renowned artists on stage. Robbie Williams, the Red Hot Chili Peppers, Blur and singer Rosalia will share the stage with French singers such as Aya Nakamura, Petit Biscuit, Agar Agar, Pomme and JAIN.",
#   start_date: DateTime.now + 1.day,
#   end_date: DateTime.now + 3.days
# )
# vieillescharrues.photos.attach(io: URI.open("https://cdn.vieillescharrues.asso.fr/wp-content/uploads/2022/12/visuel_OG_VieillesCharrues23_V2.jpg"), filename: "seed.png", content_type: "image/png")
# vieillescharrues.save!

# puts "Events created : #{Event.count}"

# puts "---------------------------------------"
# puts "Creating Rewards"

Event.all.each do |event|
  beer = Reward.create(
    title:  "Beer challenge",
    event: event,
    description:  "Find your match and go get a beer at the bar with a 30% discount!"
  )
  beer.photo.attach(io: URI.open("https://images.unsplash.com/photo-1535958636474-b021ee887b13?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80"), filename: "seed.png", content_type: "image/png")
  beer.save!

  burger = Reward.create(
    title:  "Burger challenge",
    event: event,
    description:  "Find your match and go get a burger at the restaurant with a 15% discount!"
  )
  burger.photo.attach(io: URI.open("https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1899&q=80"), filename: "seed.png", content_type: "image/png")
  burger.save!

  tshirt = Reward.create(
    title:  "T-shirt challenge",
    event: event,
    description:  "Find your match and buy a t-shirt at the merch shop with a 10% discount!"
  )
  tshirt.photo.attach(io: URI.open("https://images.unsplash.com/photo-1576566588028-4147f3842f27?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80"), filename: "seed.png", content_type: "image/png")
  tshirt.save!
end

puts "Rewards created : #{Reward.count}"

puts "---------------------------------------"
puts "Creating Participations"

hints = ["coiffe indienne", "ailes d'anges", "costume de dinosaure", "veste militaire", "masque de loup", "bicorne", "drapeau breton", "lunettes rouge et t-shirt jaune à pois verts"]

User.all.each do |user|
  Event.all.each do |event|
    Participation.create!(
      hint: hints.sample,
      user: user,
      event: event
  )
  end
end

puts "Participations created : #{Participation.count}"

# puts "---------------------------------------"
# puts "Creating Reward Choices"

# demo_users = [mickael, robert, jessica, hugo, melanie]

# Participation.all.each do |participation|
#   choice = RewardChoice.create(
#   status: [0, 1].sample,
#   user: participation.user,
#   reward: Reward.all[event: participation.event].sample
# )
#   puts "#{participation.user} chooses to participate in the #{participation.reward} challenge"
# end

puts "---------------------------------------"
puts "Creating Relationships"

Event.all.each do |event|
  Participation.where(event: event.id).each do |participation|
    Relationship.create(
      status: 1,
      sender: participation,
      receiver: Participation.where(event: event.id).where.not(user: participation.user).sample
    )
  end
end

puts "Relationships created : #{Relationship.count}"

# puts "---------------------------------------"
# puts "Creating Challenges"

# Relationship.all.each do |relationship|
#   Challenge.create(
#     description: relationship.participation.event,
#     relationship: relationship,
#     reward:
#   )

puts "---------------------------------------"
puts "Creating Challenges"

Relationship.all.each do |relationship|
  Challenge.create(
    reward: Reward.all.sample,
    relationship: relationship,
    status: 1
  )
end

puts "Challenges created : #{Challenge.count}"

# puts "---------------------------------------"
# puts "Creating Messages"

# Message.create(
#   user_id: 1,
#   challenge_id:
# )

# t.text "content"
#     t.bigint "user_id", null: false
#     t.bigint "challenge_id", null: false
