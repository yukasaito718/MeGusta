class Item < ApplicationRecord
	has_many :comments
	has_many :favorites
	belongs_to :maker
	attachment :image
end
