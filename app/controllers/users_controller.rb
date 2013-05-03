class UsersController < ApplicationController

	def show
		@title = User.find(params[:id]).full_name
		@user = User.find(params[:id])
	end

	def new
		@title = "Sign Up"
		@user = User.new
	end

	def create
		@title = "Sign Up"
		@user = User.new(params[:user])
		if @user.save
			flash[:success] = "Welcome to Rescue Funder!"
			redirect_to @user
		else
			render 'new'
		end
	end

end
