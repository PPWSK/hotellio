class AddLocationToAccommodations < ActiveRecord::Migration
  def change
    add_column :accommodations, :location, :string
  end
end
