class User::FavoritesController < ApplicationController
		before_action :authenticate_user!	#お気に入り機能

	def create
		@item = Item.find(params[:item_id])
		favorite = current_user.favorites.build(item_id: @item.id)
		favorite.save
		@item.reload
		# respond_to do |format|
		# format.js
	end

	def destroy
		# @item = Favorite.find(params[:item_id]).item
		@item = Item.find(params[:item_id])
	    favorite = Favorite.find_by(item_id: @item.id, user_id: current_user.id)
	    favorite.destroy
	    @item.reload
	    # respond_to do |format|#JSを返すrailsの仕様
        	# format.js
    	# end
	end
end
