class AddItemIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :item_id, :integer
    add_column :favorites, :user_id, :integer
  end
end
