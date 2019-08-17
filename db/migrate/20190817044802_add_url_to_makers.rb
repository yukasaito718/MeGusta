class AddUrlToMakers < ActiveRecord::Migration[5.2]
  def change
    add_column :makers, :url, :text
  end
end
