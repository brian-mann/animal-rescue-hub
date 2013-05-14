class UsersController < ApplicationController
	before_filter :require_admin_user, 			only: [:index, :destroy]
	before_filter :signed_in_user, 					only: [:edit, :update]
	before_filter :correct_user,   					only: [:edit, :update]
	before_filter :redirect_signed_in_user, only: [:new, :create]

	def index
		@users = User.paginate(page: params[:page], :per_page => 50)
	end

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
			sign_in @user
			flash[:success] = "Welcome to Rescue Funder!"
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
		@title = "Edit Profile"
	end

	def update
		if @user.update_attributes(params[:user])
			flash[:success] = "Profile Updated"
			sign_in @user
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User was successfully deleted."
		redirect_to users_url
	end

	private

		def signed_in_user
			unless signed_in?
			  store_location
			  redirect_to signin_url, notice: "Please sign in."
			end
		end

		def redirect_signed_in_user
			redirect_to user_path(current_user) if signed_in?
		end

		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_path) unless current_user?(@user)
		end
end