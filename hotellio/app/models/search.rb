class Search
  include ActiveModel::Model


  attr_accessor :location, :start_date, :end_date, :number_rooms

  validates :number_rooms, presence: true

end
