class Shop < ApplicationRecord
	belongs_to :maker
	has_many :items, through: :makers
	has_many :items, through: :shop_items
	
	validates :name, presence: true, length: { maximum: 25 }
	validates :name_hurigana, presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠]+\z/, message: "全角文字のみが使用できます" }
	validates :street_address, presence: true, length: { maximum: 7 }
	validates :postal_code, presence: true, length: { maximum: 7 }, format: { with: /\A[0-9]+\z/, message: "半角数字のみが使用できます" }
	validates :phone_number, presence: true, length: { maximum: 11 }

end
