class AddFavoritesCountToItems < ActiveRecord::Migration[5.2]

#rails db:migrateしたときに実行
  def up
    add_column :items, :favorites_count, :integer, null: false, default: 0
  end

# rails db:rollbackしたときに実行
  def down
  	remove_column :items, :favorites_count
  end
end
