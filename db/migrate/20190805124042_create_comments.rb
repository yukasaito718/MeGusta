class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :comment
      t.text :image_id

      t.timestamps
    end
  end
end
