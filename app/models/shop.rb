class Shop < ApplicationRecord
	belongs_to :maker
	attachment :image
	has_many :items, through: :makers
	has_many :items, through: :shop_items
end
