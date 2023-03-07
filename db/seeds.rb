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

admin_user = User.new(email: "admin@mail.com", password: "password", first_name: "Bob", last_name: "L'admin", address: Faker::Address.full_address, admin: true)
admin_user.photo.attach(io: URI.open("https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"), filename: "seed.png", content_type: "image/png")

client_user1 = User.new(email: "client1@mail.com", password: "password", first_name: "Marie", last_name: "Sixtine", address: Faker::Address.full_address)
client_user1.photo.attach(io: URI.open("https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"), filename: "seed.png", content_type: "image/png")

client_user2 = User.new(email: "client2@mail.com", password: "password", first_name: "Thomas", last_name: "Pesquet", address: Faker::Address.full_address)
client_user2.photo.attach(io: URI.open("https://images.unsplash.com/photo-1531123897727-8f129e1688ce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cG9ydHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"), filename: "seed.png", content_type: "image/png")

client_user3 = User.new(email: "client3@mail.com", password: "password", first_name: "Louis", last_name: "Quatorze", address: Faker::Address.full_address)
client_user3.photo.attach(io: URI.open("https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"), filename: "seed.png", content_type: "image/png")

owner_user = User.new(email: "owner@mail.com", password: "password", first_name: "Fred", last_name: "Eric", address: Faker::Address.full_address)
owner_user.photo.attach(io: URI.open("https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"), filename: "seed.png", content_type: "image/png")

admin_user.save!
puts "Admin: #{admin_user.first_name}"
client_user1.save!
puts "Client 1: #{client_user1.first_name}"
client_user2.save!
puts "Client 2: #{client_user2.first_name}"
client_user3.save!
puts "Client 3: #{client_user3.first_name}"

puts "---------------------------------------"

puts "Creating Events"

  event = Event.new(
    name: "Solidays",
    category:
    date:
    address:
    dascription:
  )
  PHOTOS_SOLIDAYS_URL =
  PHOTOS_SOLIDAYS_URL.shuffle.each { |url| event.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  event.save!

  event = Event.new(
    name: "Printemps de Bourges",
    category:
    date:
    address:
    dascription:
  )
  PHOTOS_PRINTEMPS_DE_BOURGES_URL =
  PHOTOS_PRINTEMPS_DE_BOURGES_URL.shuffle.each { |url| event.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  event.save!

  event = Event.new(
    name: "Hellfest",
    category:
    date:
    address:
    dascription:
  )
  PHOTOS_HELLFEST_URL =
  PHOTOS_HELLFEST_URL.shuffle.each { |url| event.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  event.save!

  event = Event.new(
    name: "Garorock",
    category:
    date:
    address:
    dascription:
  )
  PHOTOS_GAROROCK_URL =
  PHOTOS_GAROROCK_URL.shuffle.each { |url| event.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  event.save!

  event = Event.new(
    name: "Marsatac",
    category:
    date:
    address:
    dascription:
  )
  PHOTOS_MARSATAC_URL =
  PHOTOS_MARSATAC_URL.shuffle.each { |url| event.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  event.save!

  event = Event.new(
    name: "Francofolies",
    category:
    date:
    address:
    dascription:
  )
  PHOTOS_FRANCOFOLIES_URL =
  PHOTOS_FRANCOFOLIES_URL.shuffle.each { |url| event.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  event.save!

  event = Event.new(
    name: "Main Square Festival",
    category:
    date:
    address:
    dascription:
  )
  PHOTOS_MAIN_SQUARE_FESTIVAL_URL = 
  PHOTOS_MAIN_SQUARE_FESTIVAL_URL.shuffle.each { |url| event.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  event.save!

  puts "---------------------------------------"

  puts "Creating Rewards"

  reward = Reward.new(description: "Get 30% discount on your Burger at the Grill House")
  reward.photo.attach(io: URI.open("..." , filename: "seed.png", content_type: "image/png")
  reward.save!

  reward = Reward.new(description: "Get 50% off on your Beer at Joe's")
  reward.photo.attach(io: URI.open("..." , filename: "seed.png", content_type: "image/png")
  reward.save!

  reward = Reward.new(description: "")
  reward.photo.attach(io: URI.open("..." , filename: "seed.png", content_type: "image/png")
  reward.save!

  reward = Reward.new(description: "")
  reward.photo.attach(io: URI.open("..." , filename: "seed.png", content_type: "image/png")
  reward.save!

  reward = Reward.new(description: "")
  reward.photo.attach(io: URI.open("..." , filename: "seed.png", content_type: "image/png")
  reward.save!

  reward = Reward.new(description: "")
  reward.photo.attach(io: URI.open("..." , filename: "seed.png", content_type: "image/png")
  reward.save!
