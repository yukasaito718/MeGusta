class User::ItemsController < ApplicationController
	def index
		# keywords = params[:keywords] ? params[:keywords].split : ""
		if params[:keywords]
			keywords = params[:keywords].gsub('　', ' ').split#gsub（全角SP、半角SP）全角SPを半角SPに変換する⇒splitに半角で渡す
		else
			keywords = ""
		end
		@items = Item.search(keywords)
	end
	def show
		@item = Item.find(params[:id])
		@comment = Comment.new
		@comments = @item.comments
	end
end