class User::HomesController < ApplicationController
	def top
		@categories = Category.all
	end
end
