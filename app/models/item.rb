class Item < ApplicationRecord
	has_many :comments
	has_many :favorites, dependent: :destroy
	belongs_to :maker
	attachment :image
	has_many :item_category_relations
	has_many :categories, through: :item_category_relations
	has_many :iine_users, through: :favorites, source: :user

	 # アイテムをお気に入りする
	def iine(user)
		favorites.create(user_id: user.id)
	end

	# アイテムのお気に入りを解除する
	def uniine(user)
		favorites.find_by(user_id: user.id).destroy
	end
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
		end
			results.uniq#検索結果の重複を取り除く
		else
			all
		end
	end

	def self.search_for_shop(keyword)#classメソッド（ショップ名からアイテムを見つけ出す）
		shop = Shop.find_by(name: keyword)#shopのモデルの中からkeywordと同じショップ名を探してIDをshop変数に入れる
		maker = shop.try(:maker)#shopのIDから紐づくmakerIDを見つけ出す。try ⇒ nilならスルーしてくれる
		maker.try(:items)#makerIDから紐づくitemのIDを見つけ出す。try ⇒ nilならスルーしてくれる
	end
end

　