class User::HomesController < ApplicationController
	def top
		@categories = Category.all#カテゴリー一覧
		@all_ranks = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(5).pluck(:item_id))#ランキング機能
		# @category_rank = Item.find(Category.group(:item_id)).order('favorite_count').limit(3).pluck(:item_id)
		# @my_ranks = @all_ranks.select{ |note| note.user_id  }
	end
end
