class AddDatesToAccommodations < ActiveRecord::Migration
  def change
    add_column :accommodations, :start_date, :date
    add_column :accommodations, :end_date, :date
  end
end
