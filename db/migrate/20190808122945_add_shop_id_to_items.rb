class AddShopIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :shop_id, :integer
    add_column :items, :is_refrigeration, :boolean
    add_column :items, :is_packaged, :boolean
  end
end
