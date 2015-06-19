class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :accommodation
  # has_one :user, through :accommodations, as 'owner'
end
