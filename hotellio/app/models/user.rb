class User < ActiveRecord::Base
  has_many :accommodations
  has_many :reviews, through: :accommodations
  has_one :account

  validates :first_name, :last_name, :birthdate, :gender, :description, :phone_number, presence: true
  validates :phone_number, uniqueness: true
end
