class Admin::CategoriesController < ApplicationController
	before_action :authenticate_admin!
	def new
		@category = Category.new
	end
	def create
		@category = Category.new(category_params)
		if @category.save
		redirect_to admin_path
		else
		redirect_to new_admin_category_path
		end
	end
	def edit
		@category = Category.find(params[:id])
	end
	def update
		@category = Category.find(params[:id])
		if @category.update(category_params)
		redirect_to admin_path
		else
		redirect_to admin_path
		end
	end
	def destroy
		category = Category.find(params[:id])
		category.destroy
		redirect_to admin_path
	end
	private
	def category_params
	params.require(:category).permit(:name)
	end
end
