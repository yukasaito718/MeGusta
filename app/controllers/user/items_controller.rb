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
					Category.find(params[:category_id]).items.page(params[:page]).per(16)
				 else
				 	Kaminari.paginate_array(Item.search(keywords)).page(params[:page]).per(16)
				 	#Item.search(keywords).page(params[:page]).per(5).reverse_order
				 end
		@categories = Category.all

	end
	def show
		@item = Item.find(params[:id])
		@comment = Comment.new
		@comments = @item.comments
		@shop = Shop.new
		@shops = @item.shops
		@categories = Category.all
	end

	private
	def shop_params
      params.require(:shop).permit(:street_address, :latitude, :longitude)
    end
end