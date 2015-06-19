class User < ActiveRecord::Base
  has_many :accommodations
  has_many :reviews
  has_many :bookings
  has_one :account

  has_attached_file :picture,
   styles: { medium: "300x300>", small: "50x50>", thumb: "100x100>" }

  validates :first_name, :last_name, :birthdate, :gender, :description, :phone_number, presence: true
  validates :phone_number, uniqueness: true
  validates :gender, inclusion: { in: ["female", "male", "other"] }
  validates_attachment_content_type :picture,
   content_type: /\Aimage\/.*\z/
end
