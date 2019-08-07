class ApplicationController < ActionController::Base

	def after_sign_in_path_for(resource)
		if resource.is_a?(Admin)#Administrator　model名
	  		admin_path
		elsif resource.is_a?(Maker)
			maker_path
		else
			root_path
    	end
  	end

	def after_sign_out_path_for(resource_or_scope)
    	if resource_or_scope == :user
      		new_user_session_path
      	elsif resource_or_scope == :maker
      		new_maker_session_path
    	else
      		new_admin_session_path
    	end
  	end

	protected#ストロングパラメータ

	def configure_permitted_parameters
  	#ユーザ登録(sign_up)の際、ユーザ名(name)のデータ操作が許可される
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :last_name, :first_name, :last_name_katakana, :first_name_katakana, :street_address,:postal_code, :phone_number, :name_hurigana,])
    	devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
	end
end
