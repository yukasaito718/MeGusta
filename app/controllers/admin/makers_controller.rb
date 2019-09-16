class Admin::MakersController < ApplicationController
	before_action :authenticate_admin!

	def destroy
		maker = Maker.find(params[:id])
		maker.destroy
		redirect_to admin_path
	end
end
