class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.string :gender
      t.text :description
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
