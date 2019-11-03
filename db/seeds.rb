# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'aws-sdk' 

one_to_ten = (1..10).to_a
price = (50..320).to_a
state_rand = ["VIC", "NSW", "WA", "TAS", "NT", "ACT", "QLD", "SA"]
suburb = ["Melbourne", "Perth", "Hobart"]

one_to_ten.each do |user|
  User.create(email: Faker::Internet.email, password: "password")
  user_detail = UserDetail.create(name: Faker::Name.name, description: Faker::Lorem.sentence(word_count: 15),  user_id: user, user_type: 0)

  one_to_seven = (1..7).to_a 
  user_image = "user#{one_to_seven.sample}.png"
  user_detail.picture.attach(io: File.open("app/assets/images/users/#{user_image}"), filename: "#{user_image}")
  user_detail.save

  1.times do |thing|
    suburb1 = suburb.sample.upcase
    Location.create(state: state_rand.sample, suburb: suburb1, address_line: "123 fake street", postcode: "3000", user_detail_id: user, latitude: Geocoder.search(suburb1).first.coordinates[0].to_d, longitude: Geocoder.search(suburb1).first.coordinates[1].to_d)
  end

  #in sq inch
  head_size_rand = (85..135).to_a
  #in inches
  length_rand = (27..29).to_a
  #in grams
  strung_weight_rand = (226..400).to_a
  balance_rand = (-10..10).to_a
  string_pattern_rand = ['16x16', '16x18', '18x20']
  brand_rand = ["wilson", "head", "yonex", "babolat", "dunlop", "gamma", "prince", "prokennex", "technifibre", "volkl"]
  racquet_type_rand = [0, 1]

  one_to_ten.sample.times do
    #make racquet
    racquet = Racquet.create(title: Faker::Ancient.god + " Racquet", description: Faker::Lorem.sentence(word_count: 10), head_size: head_size_rand.sample, length: length_rand.sample, strung_weight: strung_weight_rand.sample, balance: balance_rand.sample, stiffness: 50, string_pattern: string_pattern_rand.sample, brand: brand_rand.sample, racquet_type: racquet_type_rand.sample, seller_user_id: user, price: price.sample)
    #attach AWS image
    racquet_image = "#{one_to_ten.sample}.png"
    racquet.picture.attach(io: File.open("app/assets/images/racquets/#{racquet_image}"), filename: "#{racquet_image}")
    racquet.save
    #assign status
    Status.create(sold: false, racquet_id: racquet.id, view_count: 0)
  end

  one_to_ten.sample.times do
    #make favourites
    Favourite.create(user_id: one_to_ten.sample, racquet_id: one_to_ten.sample)
  end
end

suburb2 = suburb.sample.upcase

#admin user
User.create(email: "admin@admin.com", password: "password")
UserDetail.create(name: "admin", description: "the boss", user_id: 11, user_type: 1)
#added recently - could cause issues?
Location.create(state: state_rand.sample, suburb: suburb2, address_line: "123 fake street", postcode: "3000", user_detail_id: 11, latitude: Geocoder.search(suburb2).first.coordinates[0].to_d, longitude: Geocoder.search(suburb2).first.coordinates[1].to_d)

#normal user
User.create(email: "com@com.com", password: "password")
UserDetail.create(name: "com", description: "a normal user", user_id: 12, user_type: 0)
#added recently- could cause issues?
Location.create(state: state_rand.sample, suburb: suburb2, address_line: "123 fake street", postcode: "3000", user_detail_id: 12, latitude: Geocoder.search(suburb2).first.coordinates[0].to_d, longitude: Geocoder.search(suburb2).first.coordinates[1].to_d)