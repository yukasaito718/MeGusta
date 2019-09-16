class Maker::ShopsController < ApplicationController
	before_action :authenticate_maker!

	def new
		@shop = Shop.new
	end
	def create
		@shop = Shop.new(shop_params)
		@shop.maker_id = current_maker.id
		if @shop.save!
			flash[:notice] = "登録しました。"
			redirect_to makerpage_path
		else
			flash[:notice] = "登録に不備があり、登録できませんでした。"
			redirect_to makerpage_path
		end
	end
	def edit
		@shop = Shop.find(params[:id])
	end
	def update
		@shop = Shop.find(params[:id])
		if @shop.update(shop_params)
			flash[:notice] = "内容を更新しました。"
			redirect_to makerpage_path
		else
			flash[:notice] = "更新できませんでした。"
			redirect_to makerpage_path
		end
	end
	def destroy
		shop = Shop.find(params[:id])
		shop.destroy
		redirect_to makerpage_path
	end

	private

	def shop_params
		params.require(:shop).permit(:name, :name_hurigana, :postal_code, :street_address, :phone_number, :maker_id )
	end
end
