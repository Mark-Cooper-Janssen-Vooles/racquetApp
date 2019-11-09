class UserDetail < ApplicationRecord
  belongs_to :user
  has_one :location, :dependent => :destroy
  accepts_nested_attributes_for :location

  has_one_attached :picture, dependent: :destroy

  validates :name, :description, :user_type, presence: true
  #enum for user_type:
  enum user_type: { non_admin: 0, admin: 1 }
  validates :name, :description, :picture, presence: true
  validates :name, length: { minimum: 2, too_short: ": Please add a longer name!", maximum: 40, too_long: ": Please shorten your name to under 15 characters." }
  validates :description, length: { minimum: 20,
  too_short: ": Please add a longer description!", maximum: 100, too_long: ": Please shorten your description to under 100 characters." }
end

