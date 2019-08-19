class Shop < ApplicationRecord
	belongs_to :maker
	attachment :image
	has_many :items, through: :maker
end
