class Location < ApplicationRecord
  belongs_to :user_detail
  validates :state, :suburb, :address_line, :postcode, presence: true

  # states = Ausburbs.state_names.join(',').tr(',', ' ')
  
  # VALID_STATES = %w(Peter Paul Mary)
  VALID_STATES = Ausburbs.state_names
  validates_inclusion_of :state, :in => VALID_STATES

  valid_suburbs = []
  
  VALID_STATES.each do |state|
    Ausburbs.state(state).suburbs.each do |suburb|
      valid_suburbs.push(suburb.name)
    end
  end

  validates_inclusion_of :suburb, :in => valid_suburbs

  valid_postcodes = []

  Ausburbs.state_names.each do |state|
    Ausburbs.state(state).suburbs.each do |suburb|
      valid_postcodes.push(suburb.postcode)
    end
  end

  validates_inclusion_of :postcode, :in => valid_postcodes

end


