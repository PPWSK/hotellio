class User < ActiveRecord::Base
  has_many :accommodations
  has_many :reviews
  has_many :bookings
  has_one :account

  validates :first_name, :last_name, :birthdate, :gender, :description, :phone_number, presence: true
  validates :phone_number, uniqueness: true
  validates :gender, inclusion: { in: ["female", "male", "other"] }
end
