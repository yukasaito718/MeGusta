class Item < ApplicationRecord
	has_many :comments
	has_many :favorites
	belongs_to :maker
	attachment :image

	def self.Item_search(keyword)
		unless keyword.empty?
		where(['item_name LIKE ?', "%#{keyword}%"])
		else
		all
		end
	end
end
