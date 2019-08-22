class CreateShopItems < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_items do |t|
      t.integer :item_id
      t.integer :shop_id

      t.timestamps
    end
  end
end
