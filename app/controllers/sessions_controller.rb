class SessionsController < ApplicationController

	def new
		@title = "Sign In"
	end

	def create
		@title = "Sign In"
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to user
		else
			puts "create"
			flash.now[:error] = 'Incorrect email/password combination' # Not quite right!
			render :new
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end

end
