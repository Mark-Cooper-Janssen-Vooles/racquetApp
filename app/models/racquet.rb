class Racquet < ApplicationRecord
  belongs_to :seller_user, class_name: 'User'
  has_one :status
  has_many :shopping_carts

  # enum brand: { wilson: 0, head: 1, yonex: 2, babolat: 3, dunlop: 4, gamma: 5, prince: 6, prokennex: 7, technifibre: 8, volkl: 9 }

  validates :brand, inclusion: { in: %w(wilson head yonex babolat dunlop gamma prince prokennex technifibre volkl), message: "%{value} is not a valid brand" }

  enum racquet_type: { modern: 0, classic: 1 }

  has_one_attached :picture
end
