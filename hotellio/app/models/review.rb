class Review < ActiveRecord::Base
  belongs_to :accommodation

  validates :rating, :description, presence: true
  validates :accommodation, presence: true
end
