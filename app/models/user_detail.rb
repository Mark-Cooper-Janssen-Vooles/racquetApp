class UserDetail < ApplicationRecord
  belongs_to :user
  has_one :location

  validates :name, :description, :user_type, presence: true
  #enum for user_type:
  enum user_type: { normal: 0, admin: 1 }
end

