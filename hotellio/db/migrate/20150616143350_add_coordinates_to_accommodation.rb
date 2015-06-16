class AddCoordinatesToAccommodation < ActiveRecord::Migration
  def change
    add_column :accommodations, :latitude, :float
    add_column :accommodations, :longitude, :float
  end
end
