class AnimalsController < ApplicationController
	respond_to :json
	
	def index
		@animals = Animal.all
	end
end