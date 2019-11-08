class Location < ApplicationRecord
  belongs_to :user_detail
  validates :state, :suburb, :postcode, presence: true

  #do hash of stuff...

  valid_postcodes = []
  Ausburbs.state_names.each do |state|
    Ausburbs.state(state).suburbs.each do |suburb|
      valid_postcodes.push(suburb.postcode)
    end
  end
  validates_inclusion_of :postcode, :in => valid_postcodes

  VALID_STATES = Ausburbs.state_names

  valid_suburbs = []
  VALID_STATES.each do |state|
    Ausburbs.state(state).suburbs.each do |suburb|
      valid_suburbs.push(suburb.name)
    end
  end
  validates_inclusion_of :suburb, :in => valid_suburbs

  validates_inclusion_of :state, :in => VALID_STATES


  #make a hash which has postcode, state and suburb
end


