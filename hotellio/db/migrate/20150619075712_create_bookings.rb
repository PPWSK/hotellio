class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.string :price
      t.string :number_of_guests

      t.references :user, index: true
      t.references :accommodation, index: true

      t.timestamps null: false
    end
  end
end
