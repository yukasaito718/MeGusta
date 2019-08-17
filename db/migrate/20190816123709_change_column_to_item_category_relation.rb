class ChangeColumnToItemCategoryRelation < ActiveRecord::Migration[5.2]
  def change
  	rename_column :item_category_relations, :post_id, :item_id
  end
end
