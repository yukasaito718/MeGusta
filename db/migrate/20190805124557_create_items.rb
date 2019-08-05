class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :price
      t.boolean :is_sold
      t.text :image_id
      t.integer :count
      t.text :url

      t.timestamps
    end
  end
end
