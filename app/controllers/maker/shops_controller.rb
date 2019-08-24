class Maker::ShopsController < ApplicationController
	before_action :authenticate_maker!
	def new
		@shop = Shop.new
	end
	def create
		@shop = Shop.new(shop_params)
		@shop.maker_id = current_maker.id
		if @shop.save
			flash[:notice] = "商品登録に成功しました。"
			redirect_to new_maker_path
		else
			redirect_to new_maker_shop_path
		end
	end
	def shop_params
		params.require(:shop).permit(:name, :name_hurigana, :postal_code, :street_address, :phone_number, :maker_id )
	end
end
