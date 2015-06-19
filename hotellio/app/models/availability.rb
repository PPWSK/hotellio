class Availability < ActiveRecord::Base
  belongs_to :accommodation

  validates :start_date, :end_date, presence: true
  validates :accommodation, presence: true

  # def start_date=(new_date)
  #     @start_date = Date.parse(new_date)
  # end

  # def end_date=(new_date)
  #     @end_date = Date.parse(new_date)
  # end
end
