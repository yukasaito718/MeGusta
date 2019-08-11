class User::ItemsController < ApplicationController
	def index
		# keywords = params[:keywords] ? params[:keywords].split : ""
		if params[:keywords]
			keywords = params[:keywords].gsub('　', ' ').split
		else
			keywords = ""
		end
		@items = Item.search(keywords)
	end
	def show
		@item = Item.find(params[:id])
	end
end
