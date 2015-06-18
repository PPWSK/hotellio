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

    # only check guest number if filled in
    results = Accommodation.all

    if search_query.location.present?
      results = Accommodation.near(search_query.location, 20)
      if results.size.zero?
        # flash[:notice] = "No result found"
        # @accommodations = Accommodation.all
      end
    end

    # if search_query.number_rooms.present?
    #   results = results.select do |result|
    #     result.guest_number == search_query.number_rooms
    #   end
    # end

    # if (search_query.start_date.present? && search_query.end_date.present?)
    #   results = results.select do |accommodation|
    #     accommodation.start_date <= search_query.start_date && accommodation.end_date >= search_query.end_date
    #   end
    # end

    return results

    # where(guest_number: search_query.number_rooms)

    # LIke for sqlite, ILike for postgres

    # Flat.near([40.71, 100.23], 20)    # venues within 10 km of a point
    # where("title like ?", "%#{query}%")

    # User.where({ created_at: (Time.now.midnight - 1.day)..Time.now.midnight })
    # SELECT * FROM users WHERE (created_at BETWEEN '2012-06-09 07:00:00.000000' AND '2012-06-10 07:00:00.000000')

    # nearbys method
    # The nearbys method must be applied on an object not on a Class. It allows you to find other objects near the given one specifying the distance like the example below :
    # @nearby_classifieds = @classified.nearbys(10) # 10 is the distance parameter (in kilometers in our case)
  end
end
