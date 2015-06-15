class Accommodation < ActiveRecord::Base
  self.inheritance_column = nil
  has_many :reviews, dependent: :destroy
  has_many :pictures, dependent: :destroy

  validates :title, :description, :price, :type, :guest_number, presence: true
  validates :title, uniqueness: true
  validates :type, inclusion: { in: ["entire flat/house", "private room", "shared room"] }
  # todo validates :pictures, presence: true number?
end

