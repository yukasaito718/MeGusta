class Comment < ApplicationRecord
	belongs_to :item
	belongs_to :user
	attachment :image

	validates :comment, presence: true, length: { maximum: 50 }
end
