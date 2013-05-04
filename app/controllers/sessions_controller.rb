class SessionsController < ApplicationController

	def new
		@title = "Sign In"
	end

	def create
		p "create!"
		@title = "Sign In"
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			#Sign the user in and redirect to the user's show page.
		else
			puts "create"
			flash.now[:error] = 'Incorrect email/password combination' # Not quite right!
			render :new
		end
	end

	def destroy
	end

end
