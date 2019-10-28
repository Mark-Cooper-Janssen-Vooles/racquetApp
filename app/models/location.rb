class Location < ApplicationRecord
  belongs_to :user_detail
  validates :state, :suburb, :address_line, :postcode, presence: true
end

