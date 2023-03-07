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

user1 = User.new(first_name: "Toto", last_name: "Dupont")
user1.photo.attach(io: URI.open("https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"), filename: "seed.png", content_type: "image/png")
user1.save!

user2 = User.new(first_name: "Bob", last_name: "Bourville")
user2.photo.attach(io: URI.open("https://images.unsplash.com/photo-1531123897727-8f129e1688ce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cG9ydHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"), filename: "seed.png", content_type: "image/png")
user2.save!

user3 = User.new(first_name: "Nana", last_name: "Lemercier")
user3.photo.attach(io: URI.open("https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"), filename: "seed.png", content_type: "image/png")
user3.save!

user4 = User.new(first_name: "Lili", last_name: "Duroc")
user4.photo.attach(io: URI.open("https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"), filename: "seed.png", content_type: "image/png")
user4.save!

puts "---------------------------------------"

puts "Creating Events"

  event = Event.new(
    name: "Solidays",
    category:
    start_date:
    end_date:
    address:
    dascription:
  )
  PHOTOS_SOLIDAYS_URL = ["https://cdn.sortiraparis.com/images/61/1665/838944-solidays-2023-a-paris-ouverture-de-la-billetterie-debut-fevrier.jpg",
    "https://europebookings.com/wp-content/uploads/solidays-festival-stage-view-fans.jpg"]
  PHOTOS_SOLIDAYS_URL.shuffle.each { |url| event.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  event.save!

  event = Event.new(
    name: "Printemps de Bourges",
    category:
    start_date:
    end_date:
    address:
    dascription:
  )
  PHOTOS_PRINTEMPS_DE_BOURGES_URL = ["https://www.lagencemoderne.com/wp-content/uploads/2015/01/printemps-de-bourges-2023-20221118154839.jpeg",
  "https://uploads.lebonbon.fr/source/2020/april/2006698/printempsligne_2_1200.jpg"]
  PHOTOS_PRINTEMPS_DE_BOURGES_URL.shuffle.each { |url| event.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  event.save!

  event = Event.new(
    name: "Hellfest",
    category:
    start_date:
    end_date:
    address:
    dascription:
  )
  PHOTOS_HELLFEST_URL = ["https://studiovolume.fr/wp-content/uploads/2020/04/HELLFEST-1-2500x1819.jpg",
  "https://img.20mn.fr/00wb7v5wRZ65wayIj6lDbg/960x614_heavy-metal-fans-attend-the-hellfest-heavy-metal-and-hard-rock-music-festival-on-june-17-2016-in.jpg",
  "https://www.breizh-info.com/wp-content/uploads/2018/06/hellfest.jpg"]
  PHOTOS_HELLFEST_URL.shuffle.each { |url| event.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  event.save!

  event = Event.new(
    name: "Garorock",
    category:
    start_date:
    end_date:
    address:
    dascription:
  )
  PHOTOS_GAROROCK_URL = ["https://agendaculturel.emstorage.fr/garorock-2023-20220705160815.png",
  "https://www.geekgeneration.fr/wp-content/uploads/2022/12/Garorock-2023-1068x601.jpg"]
  PHOTOS_GAROROCK_URL.shuffle.each { |url| event.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  event.save!

  event = Event.new(
    name: "Marsatac",
    category:
    start_date:
    end_date:
    address:
    dascription:
  )
  PHOTOS_MARSATAC_URL = ["https://madeinmarseille.net/actualites-marseille/2018/03/programme-festival-marsatac-parc-chanot.jpg",
    "https://th.bing.com/th/id/OIP.mQ2YO58Sm0u0jEw-j7Qs4wHaCv?pid=ImgDet&rs=1"]
  PHOTOS_MARSATAC_URL.shuffle.each { |url| event.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  event.save!

  event = Event.new(
    name: "Francofolies",
    category:
    start_date:
    end_date:
    address:
    dascription:
  )
  PHOTOS_FRANCOFOLIES_URL = ["https://agendaculturel.emstorage.fr/francofolies-20221124110139.png",
    "https://agendaculturel.emstorage.fr/crop400x266/francofolies-20220725145123.jpg"]
  PHOTOS_FRANCOFOLIES_URL.shuffle.each { |url| event.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  event.save!

  event = Event.new(
    name: "Main Square Festival",
    category:
    start_date:
    end_date:
    address:
    dascription:
  )
  PHOTOS_MAIN_SQUARE_FESTIVAL_URL = ["https://th.bing.com/th/id/R.71f7728990b3218689bd7452358b238e?rik=EsyM%2b2GhUdxLMg&pid=ImgRaw&r=0",
    "https://yellow.radio/wp-content/uploads/2022/07/main-square-festival-public-768x290.jpg"]
  PHOTOS_MAIN_SQUARE_FESTIVAL_URL.shuffle.each { |url| event.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  event.save!

  puts "---------------------------------------"

  puts "Creating Rewards"

  reward = Reward.new(name: "Burger Discount", description: "Get 30% discount on your Burger at the Grill House")
  reward.photo.attach(io: URI.open("https://images.unsplash.com/photo-1550547660-d9450f859349?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80"), filename: "seed.png", content_type: "image/png")
  reward.save!

  reward = Reward.new(name: "Beer Discount", description: "Get 50% off on your Beer at the Beer House")
  reward.photo.attach(io: URI.open("https://images.unsplash.com/photo-1608270586620-248524c67de9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"), filename: "seed.png", content_type: "image/png")
  reward.save!

  reward = Reward.new(name: "Voucher", description: "Win a voucher on the next festival of your choice")
  reward.photo.attach(io: URI.open("https://plus.unsplash.com/premium_photo-1670152411569-7cbc00946857?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1615&q=80"), filename: "seed.png", content_type: "image/png")
  reward.save!

  reward = Reward.new(name: "Goodies", description: "Win some free Goodies of the festival")
  reward.photo.attach(io: URI.open("https://images.unsplash.com/photo-1549465220-1a8b9238cd48?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1140&q=80"), filename: "seed.png", content_type: "image/png")
  reward.save!

  reward = Reward.new(name: "Meet your favorite Artist" description: "Get the chance to meet your favorite Aritist of the festival for a few minutes at the end of the night")
  reward.photo.attach(io: URI.open("https://images.unsplash.com/photo-1559769732-3a943df124b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"), filename: "seed.png", content_type: "image/png")
  reward.save!

  reward = Reward.new(name: "Shot time", description: "Buy 2 shots at Joe's and get 2 for free")
  reward.photo.attach(io: URI.open("https://images.unsplash.com/photo-1546171753-97d7676e4602?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"), filename: "seed.png", content_type: "image/png")
  reward.save!
