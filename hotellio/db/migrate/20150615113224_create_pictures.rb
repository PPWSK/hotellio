class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :caption
      t.references :accommodation, index: true

      t.timestamps null: false
    end
  end
end
