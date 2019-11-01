class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :statuses
  has_many :racquets, foreign_key: :seller_user_id
  has_many :shopping_carts

  has_one :user_detail
  has_one :favourite
end
