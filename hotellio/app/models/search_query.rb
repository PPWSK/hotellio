class SearchQuery
  include ActiveModel::Model

  attr_accessor :location
  attr_reader :start_date
  attr_reader :end_date
  attr_accessor :number_rooms

  validates :number_rooms, numericality: true
  validates :number_rooms, presence: true

  def start_date=(new_date)
    @start_date = Date.parse(new_date)
  end

  def end_date=(new_date)
    @end_date = Date.parse(new_date)
  end

  def with_some_defaults
    @location = "Brussels"
    @start_date = Date.today
    @end_date = Date.today + 7
    @number_rooms = 2
    self
  end

end
