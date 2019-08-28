class Admin::ShopsController < ApplicationController
	before_action :authenticate_admin!

	def destroy
		shop = Shop.find(params[:id])
		shop.destroy
		redirect_to admin_path
	end

end
