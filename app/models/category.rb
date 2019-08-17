class Category < ApplicationRecord
  has_many :item_category_relations
  has_many :items, through: :item_category_relations
end
