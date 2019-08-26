class Maker::MakersController < ApplicationController
	before_action :authenticate_maker!

	def show
		@maker = current_maker
		@shop = Shop.new
		@shops = @maker.shops
	end

	def edit
		@maker = current_maker
	end

	def update
		@maker = Maker.find(current_maker.id)
		flag = params[:is_deleted]
  	  	if flag == 'false'
  	  	@maker.update_attribute(:is_deleted, params[:is_deleted])
  	  	sign_out_and_redirect(current_maker)
  	  	flash[:notice] = "退会しました。またのご利用をお待ちしております！"
  	  	else
	  	  	@maker = Maker.find(current_maker.id)
			if @maker.update(maker_params)
				flash[:notice] = "プロフィール内容を更新しました。"
				redirect_to makerpage_path(current_maker)
			else
				flash[:notice] = "編集の更新に失敗しました"
				redirect_to makerpage_edit_path(current_user)
			end
		end
	end

	private

	def maker_params
		params.require(:maker).permit(:name, :name_hurigana, :street_address, :phone_number, :postal_code, :email, :is_deleted, :password, :image)
	end
end

