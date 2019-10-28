class ShoppingCart < ApplicationRecord
  belongs_to :user
  belongs_to :racquet
end
