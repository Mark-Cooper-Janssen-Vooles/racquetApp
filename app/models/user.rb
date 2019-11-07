class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :statuses, :dependent => :destroy
  has_many :racquets, foreign_key: :seller_user_id, :dependent => :destroy

  has_many :messages, :dependent => :destroy

  has_one :user_detail, :dependent => :destroy
  has_one :favourite, :dependent => :destroy
end
