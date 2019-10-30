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

# credentials = Aws::Credentials.new(:access_key_id, :secret_access_key)

# s3 = Aws::S3::Resource.new(region: 'ap-southeast-2', credentials: credentials)

# s3 = Aws::S3::Client.new(profile: "m_arch", region: 'ap-southeast-2')

# s3 = Aws::S3::Resource.new

one_to_ten.each do |user|
  User.create(email: Faker::Internet.email, password: "password")
  UserDetail.create(name: Faker::Name.name, description: Faker::Lorem.sentence(word_count: 15),  user_id: user, user_type: 0)

  state_rand = ["VIC", "NSW", "WA", "TAS", "NT", "ACT", "QLD", "SA"]

  Location.create(state: state_rand.sample, suburb: "Melbourne", address_line: "123 fake street", postcode: "3000", user_detail_id: user)

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
    Racquet.create(description: Faker::Lorem.sentence(word_count: 10), head_size: head_size_rand.sample, length: length_rand.sample, strung_weight: strung_weight_rand.sample, balance: balance_rand.sample, stiffness: 50, string_pattern: string_pattern_rand.sample, brand: brand_rand.sample, racquet_type: racquet_type_rand.sample, seller_user_id: user)

    # obj = s3.bucket('racquets-9b9d5d').object('1.jpg') 
    # obj.get(response_target: 'app/assets/images/racquets/1.jpg')
    # Racquet.picture.attach(io: File.open("app/assets/images/racquets/1.jpg"), filename: "1.jpg")
  end

end

User.create(email: "admin@admin.com", password: "password")
UserDetail.create(name: "admin", description: "the boss", user_id: 11, user_type: 1)

