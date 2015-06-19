class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.references :accommodation, index: true

      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
