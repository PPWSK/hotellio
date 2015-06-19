class Availability < ActiveRecord::Base
  belongs_to :accommodation

  validates :start_date, :end_date, presence: true
  validates :accommodation, presence: true
end
