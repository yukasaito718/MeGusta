class AddLatitudeToMakers < ActiveRecord::Migration[5.2]
  def change
    add_column :makers, :latitude, :float
    add_column :makers, :longitude, :float
  end
end
