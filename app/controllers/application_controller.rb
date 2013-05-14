class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

	before_filter :set_gon_vars

	def set_gon_vars
		gon.environment = Rails.env
		gon.animal_types = AnimalType.all
	end

	def index
	end

	# Force signout to prevent CSRF attacks
	def handle_unverified_request
		sign_out
		super
	end

	private

	def require_admin_user
		redirect_to user_path(current_user) unless current_user.admin?
	end
end
