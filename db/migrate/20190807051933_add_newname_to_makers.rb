class AddNewnameToMakers < ActiveRecord::Migration[5.2]
  def change
    add_column :makers, :name, :string
  end
end
