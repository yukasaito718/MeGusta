class User::UsersController < ApplicationController
	def show
		@user = current_user
	end
	def edit
	end
	def update
		@user = User.find(current_user.id)
		flag = params[:is_deleted]
  	  	if flag == 'false'
  	  	@user.update_attribute(:is_deleted, params[:is_deleted])
  	  	sign_out_and_redirect(current_user)
  	  	flash[:notice] = "退会しました。またのご利用をお待ちしております！"
  	  	else
	  	  	@user = User.find(current_user.id)
			if @user.update(user_params)
				flash[:notice] = "プロフィール内容を更新しました。"
				redirect_to user_mypage_path(current_user)
			else
				flash[:notice] = "編集の更新に失敗しました"
				redirect_to user_mypage_edit_path(current_user)
			end
		end
	end
	private
	def user_params
		params.require(:user).permit(:name, :last_name, :first_name, :last_name_katakana, :first_name_katakana, :street_address, :phone_number, :postal_code, :email, :is_delete, :password )
	end
end
