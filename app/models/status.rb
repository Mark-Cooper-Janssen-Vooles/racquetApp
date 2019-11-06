class Status < ApplicationRecord
  #not sure about link to user???... user has_many :statuses
  belongs_to :user, optional: true
  # has_one :user
  belongs_to :racquet
end
