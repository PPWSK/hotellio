class Review < ActiveRecord::Base
  belongs_to :accommodation
  belongs_to :user

  validates :rating, :description, presence: true
  validates :accommodation, presence: true
end
