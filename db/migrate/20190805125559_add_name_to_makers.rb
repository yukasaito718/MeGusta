class AddNameToMakers < ActiveRecord::Migration[5.2]
  def change
    add_column :makers, :name_hurigana, :string
    add_column :makers, :street_address, :string
    add_column :makers, :postal_code, :string
    add_column :makers, :phone_number, :string
    add_column :makers, :image_id, :text
    add_column :makers, :is_deleted, :boolean
  end
end
