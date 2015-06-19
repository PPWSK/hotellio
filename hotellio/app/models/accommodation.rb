class Accommodation < ActiveRecord::Base
  self.inheritance_column = nil
  has_many :reviews, dependent: :destroy
  has_many :pictures, dependent: :destroy
  has_many :availabilitys, dependent: :destroy
  has_many :bookings
  belongs_to :user

  validates :title, :location, :description, :price, :type, :guest_number, presence: true
  validates :title, uniqueness: true
  validates :type, inclusion: { in: ["entire flat/house", "private room", "shared room"] }

  geocoded_by :location
  after_validation :geocode, if: :location_changed?
  # todo validates :pictures, presence: true number?

  def self.search(search_query)

    # only check guest number if filled in

    #results = Accommodation.near(search_query.location, 20).where(guest_number: search_query.number_rooms)

    if search_query.location.present? && search_query.number_rooms.present? #&& dates

      Accommodation.near(search_query.location, 20).where(guest_number: search_query.number_rooms)

    elsif search_query.location.present? && search_query.number_rooms.present?

        Accommodation.near(search_query.location, 20).where(guest_number: search_query.number_rooms)

    elsif search_query.number_rooms.present?

        Accommodation.where(guest_number: search_query.number_rooms)

    elsif search_query.location.present?

        Accommodation.near(search_query.location, 20)

    #elsif search_query.dates

    else
      Accommodation.all

    end

  end
end
