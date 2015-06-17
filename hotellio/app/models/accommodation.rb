class Accommodation < ActiveRecord::Base
  self.inheritance_column = nil
  has_many :reviews, dependent: :destroy
  has_many :pictures, dependent: :destroy
  belongs_to :user

  validates :title, :location, :description, :price, :type, :guest_number, presence: true
  validates :title, uniqueness: true
  validates :type, inclusion: { in: ["entire flat/house", "private room", "shared room"] }

  geocoded_by :location
  after_validation :geocode, if: :location_changed?
  # todo validates :pictures, presence: true number?

  def self.search(search_query)
    where(guest_number: search_query.number_rooms)
    # Flat.near([40.71, 100.23], 20)    # venues within 10 km of a point
  end
end
