class Admin::ItemsController < ApplicationController
	before_action :authenticate_admin!
	def index
	end

	def destroy
		item = item.find(params[:id])
		item.destroy
		redirect_to admin_path
	end

end
