class ApplicationController < ActionController::Base
  protect_from_forgery

	before_filter :set_gon_vars
	
	def set_gon_vars
		gon.environment = Rails.env
		gon.animal_types = AnimalType.all
	end

	def index
	end

	def coming_soon
		layout false
	end
end
