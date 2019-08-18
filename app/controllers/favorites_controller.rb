class FavoritesController < ApplicationController
		before_action :authenticate_user!	#お気に入り機能

	def create
		favorite = Favorite.new(user_id:current_user.id,item_id:params[:item_id])
		favorite.save
		format.js
	end

	def destroy
	   favorite  = Favorite.find(params[:id])
	   favorite.destroy
	   format.js
	end
end
