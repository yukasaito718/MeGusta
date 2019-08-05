class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :name_hurigana
      t.string :postal_code
      t.string :street_address
      t.string :phone_number

      t.timestamps
    end
  end
end
