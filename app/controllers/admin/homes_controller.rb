class Admin::HomesController < ApplicationController
	before_action :authenticate_admin!
  def top
  	@items = Item.all
  	@categories = Category.all
  	@shops = Shop.all
  	@users =User.all
  end

end
