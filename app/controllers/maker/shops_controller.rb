class Maker::ShopsController < ApplicationController
	before_action :authenticate_maker!
	def new
		@shop = Shop.new
	end
	def create
		@shop = Shop.new(shop_params)
		@shop.maker_id = current_maker.id
		if @shop.save
			redirect_to makerpage_path
		else
			redirect_to makerpage_path
		end
	end
	def edit
		@shop = Shop.find(params[:id])
	end
	def update
		@shop = Shop.find(params[:id])
		if @shop.update(shop_params)
			redirect_to makerpage_path
		else
			redirect_to makerpage_path
		end
	end
	def destroy
		shop = Shop.find(params[:id])
		shop.destroy
		redirect_to makerpage_path
	end
	def shop_params
		params.require(:shop).permit(:name, :name_hurigana, :postal_code, :street_address, :phone_number, :maker_id )
	end
end
