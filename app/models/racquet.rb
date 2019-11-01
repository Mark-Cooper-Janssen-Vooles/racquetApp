class Racquet < ApplicationRecord
  belongs_to :seller_user, class_name: 'User'
  has_one :status
  has_many :shopping_carts
  has_one :favourite

  accepts_nested_attributes_for :favourite

  validates :brand, inclusion: { in: %w(wilson head yonex babolat dunlop gamma prince prokennex technifibre volkl), message: "%{value} is not a valid brand" }

  enum racquet_type: { modern: 0, classic: 1 }
  validates :price, numericality: { only_float: true }
  has_one_attached :picture
end
