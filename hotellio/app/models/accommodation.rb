class Accommodation < ActiveRecord::Base
  self.inheritance_column = nil
  has_many :reviews, dependent: :destroy
  has_many :pictures, dependent: :destroy

<<<<<<< HEAD
  validates :title, :description, :price, :type, :guest_number, presence: true
  validates :location, :latitude, :longitude, presence: true
  validates :start_date, :end_date, presence: true
  # validates uniqueness latitude longitude TO DO
  validates :title, uniqueness: true
  validates :type, inclusion: { in: ["entire flat/house", "private room", "shared room"] }
  geocoded_by :location
  after_validation :geocode, if: :location_changed?

=======
  validates :title, :location, :description, :price, :type, :guest_number, presence: true
  validates :title, uniqueness: true
  validates :type, inclusion: { in: ["entire flat/house", "private room", "shared room"] }

  geocoded_by :location
  after_validation :geocode, if: :location_changed?
>>>>>>> a60c6ae941a687f6ca3e99e7e867f9405316edd7
  # todo validates :pictures, presence: true number?

  def self.search(search_query)
    where(guest_number: search_query.number_rooms)
    # Flat.near([40.71, 100.23], 20)    # venues within 10 km of a point
  end
end

