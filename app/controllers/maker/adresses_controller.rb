class Maker::AdressesController < ApplicationController
	def new
		@adress = Adress.new
	end
	def create
		@adress = Adress.find(maker_id)
		if @adress.save
			redirect_to root_path
		else
			render new
		end
	end
end
