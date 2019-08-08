class Shop < ApplicationRecord
	belongs_to :maker
	attachment :image
end
