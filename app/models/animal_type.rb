class AnimalType < ActiveRecord::Base
	
	has_many :animals
	
  attr_accessible :name
end
