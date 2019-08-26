class User::ItemsController < ApplicationController
	def index
		# keywords = params[:keywords] ? params[:keywords].split : ""
		if params[:keywords]
			keywords = params[:keywords].gsub('　', ' ').split#gsub（全角SP、半角SP）全角SPを半角SPに変換する⇒splitに半角で渡す
		else
			keywords = ""
		end
		#カテゴリーIDが渡ってきたら紐づいたitem_idを取り出す
		@items = if params[:category_id]
					Category.find(params[:category_id]).items
				 else
				 	Item.search(keywords)
				 end
		@categories = Category.all
		@post_images = Item.all.page(params[:page]).reverse_order
	end
	def show
		@item = Item.find(params[:id])
		@comment = Comment.new 
		@comments = @item.comments
		@shop = Shop.new
		@shops = @item.shops
		@categories = Category.all
	end
end