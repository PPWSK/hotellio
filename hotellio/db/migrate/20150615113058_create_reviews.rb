class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :description
      t.references :accommodation, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
