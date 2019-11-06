class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :statuses, :dependent => :destroy
  has_many :racquets, foreign_key: :seller_user_id, :dependent => :destroy

  has_many :messages, :dependent => :destroy

  has_one :user_detail, :dependent => :destroy
  has_one :favourite


  before_destroy :destroy_stuff

  private

  def destroy_stuff
    self.racquets.destroy_all
    self.messages.destroy_all
  end
end
