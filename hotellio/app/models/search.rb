class Search
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :location, :start_date, :end_date, :number_rooms

  validates :location, presence: true

end
