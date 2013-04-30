class UsersController < ApplicationController

	def show
		@title = User.find(params[:id]).first_name
		@user = User.find(params[:id])
	end

	def new
	end

end
