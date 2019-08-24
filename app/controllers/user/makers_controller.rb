class User::MakersController < ApplicationController
		before_action :authenticate_user!
end