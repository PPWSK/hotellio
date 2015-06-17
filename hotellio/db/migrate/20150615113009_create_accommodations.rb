class CreateAccommodations < ActiveRecord::Migration
  def change
    create_table :accommodations do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :type
      t.integer :guest_number

      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
