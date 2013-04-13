class AnimalsController < ApplicationController
	respond_to :json
	
	def index
		@animals = Animal.all
	end
	
	def show
		@animal = Animal.find params[:id]
	end
end