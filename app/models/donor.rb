class Donor < ActiveRecord::Base
	
	has_many :animals, :through => :donations
	
  attr_accessible :address, :city, :name, :state, :zip
end
