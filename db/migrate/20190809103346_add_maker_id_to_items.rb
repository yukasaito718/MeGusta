class AddMakerIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :maker_id, :integer
  end
end
