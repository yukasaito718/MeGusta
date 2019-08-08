class AddMakerIdToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :maker_id, :integer
  end
end
