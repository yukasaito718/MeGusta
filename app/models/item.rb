class Item < ApplicationRecord
	belongs_to :maker
	attachment :image
	#categoty
	has_many :item_category_relations
	has_many :categories, through: :item_category_relations
	#いいね
	has_many :favorites, dependent: :destroy
	has_many :iine_users, through: :favorites, source: :user
	#comment
	has_many :comments
	has_many :users, through: :comments
	#shop
	has_many :shop_items
	has_many :shops, through: :shop_items

  	validates :item_name, presence: true, length: { maximum: 25 }
   	validates :introduction,length: { maximum: 30 }
 	validates :count, presence: true, format: { with: /\A[0-9]+\z/, message: "半角数字のみが使用できます" }
  	validates :price, presence: true, numericality: { only_integer: true }
  	validates :freshness_date, presence: true, length: { maximum: 25 }




	#現在のユーザーがいいねしてたらtrueを返す
	def iine?(user)
		iine_users.include?(user)
	end


	#検索用メソッド
	def self.search(keywords)
		if keywords.present?#もしあったら
			results = []#結果を[配列]に入れて保存する
			keywords.each do |keyword|#keywordを変数に入れてdoからendまでの処理を繰り返す
				results += where(['item_name LIKE ?', "%#{keyword}%"]) unless where(['item_name LIKE ?', "%#{keyword}%"]).nil?#
				results += Item.search_for_shop(keyword) unless Item.search_for_shop(keyword).nil?#nilなら前者の記述を返す　nilのエラーの条件分岐
				results += Item.search_for_maker(keyword) unless Item.search_for_maker(keyword).nil?#nilなら前者の記述を返す　nilのエラーの条件分岐
		end
			results.uniq#検索結果の重複を取り除く
		else#空で検索した場合全商品が表示される
			all
		end
	end

	def self.search_for_shop(keyword)#classメソッド（ショップ名からアイテムを見つけ出す）
		# shop = Shop.find_by(name: keyword)#shopのモデルの中からkeywordと同じショップ名を探してIDをshop変数に入れる
		# maker = shop.try(:maker)#shopのIDから紐づくmakerIDを見つけ出す。try ⇒ nilならスルーしてくれる
		# maker.try(:items)#makerIDから紐づくitemのIDを見つけ出す。try ⇒ nilならスルーしてくれる
		# shop.items
		results = []
		shops = Shop.where('name like ?', "%#{keyword}%")
		shops.each do |shop|
			results += shop.try(:items)
		end
		results
	end
		def self.search_for_maker(keyword)#メーカー名からアイテムを見つけ出すクラスメソッド
		results = []
		makers = Maker.where('name like ?', "%#{keyword}%")
		makers.each do |maker|
			results += maker.try(:items)
		end
		results
	end

end
