class UserDetail < ApplicationRecord
  belongs_to :user
  has_one :location, :dependent => :destroy
  accepts_nested_attributes_for :location

  validates :name, :description, :user_type, presence: true
  #enum for user_type:
  enum user_type: { non_admin: 0, admin: 1 }

  has_one_attached :picture
end

