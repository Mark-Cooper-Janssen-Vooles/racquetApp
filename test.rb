require 'geocoder'

potential_country = []
Geocoder.search("Kensington").each do |reply|
  if reply.country == "Australia"
    # puts reply.coordinates[0]
    # puts reply.coordinates[1]
    potential_country.push(reply)

    puts reply.state
  end
end

puts potential_country.count