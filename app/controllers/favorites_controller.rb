class FavoritesController < ApplicationController
		before_action :authenticate_user!	#お気に入り機能

	def create
		@item = Item.find(params[:item_id])
		favorite = Favorite.new(user_id:current_user.id,item_id:params[:item_id])
		favorite.save
		respond_to do |format|
		format.js
		end
	end

	def destroy
		@item = Favorite.find(params[:id]).item
	   favorite  = Favorite.find(params[:id])
	   favorite.destroy
	    respond_to do |format|#JSを返すrailsの仕様
        format.js
    	end
	end
end
