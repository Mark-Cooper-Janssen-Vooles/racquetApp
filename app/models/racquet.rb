class Racquet < ApplicationRecord
  belongs_to :seller_user, class_name: 'User'
  has_one :status, :dependent => :destroy
  has_one :favourite, :dependent => :destroy

  accepts_nested_attributes_for :favourite

  validates :brand, inclusion: { in: %w(wilson head yonex babolat dunlop gamma prince prokennex technifibre volkl), message: "%{value} is not a valid brand" }

  enum racquet_type: { modern: 0, classic: 1 }
  
  validates :price, numericality: { only_float: true }
  validates :head_size, numericality: { greater_than: 200, less_than: 450 }, allow_blank: true 
  validates :length, numericality: { greater_than: 20, less_than: 35 }, allow_blank: true 
  validates :strung_weight, numericality: { greater_than: 225, less_than: 400 }, allow_blank: true 
  validates :balance, numericality: { greater_than: -10, less_than: 15 }, allow_blank: true 
  validates :stiffness, numericality: { greater_than: 40, less_than: 95 }, allow_blank: true


  has_one_attached :picture

  validates :title, :description, :picture, presence: true

  validates :description, length: { minimum: 20,
  too_short: ": Please add a longer description!", maximum: 150, too_long: ": Please shorten your description to under 150 characters." }
end
