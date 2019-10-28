json.extract! location, :id, :state, :suburb, :address_line, :postcode, :created_at, :updated_at
json.url location_url(location, format: :json)
