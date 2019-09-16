class Category < ApplicationRecord
  has_many :item_category_relations, dependent: :destroy
  has_many :items, through: :item_category_relations

  validates :name, presence: true, length: { maximum: 5 }
end
