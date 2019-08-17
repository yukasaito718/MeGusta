class FavoritesController < ApplicationController
	before_action :logged_in_user
	#お気に入り機能
	def create
		@item = Item.find(params[:item_id])
		@item.iine(current_user)#iine⇒itemモデルで定義したお気に入り追加メソッド
	end

	def destroy
	    @item = Favorte.find(params[:id]).item
	    @item.uniine(current_user)#uniine⇒itemモデルで定義したお気に入り解除メソッド
	end
	end
