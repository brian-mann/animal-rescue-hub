class PagesController < ApplicationController

	def privacy_policy
		@title = "Privacy Policy"
	end

	def signup
		@title = "Sign Up"
	end
end