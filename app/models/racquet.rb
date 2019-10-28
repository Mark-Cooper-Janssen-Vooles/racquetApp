class Racquet < ApplicationRecord
  belongs_to :user
  has_one :status
  has_many :shopping_carts
end
