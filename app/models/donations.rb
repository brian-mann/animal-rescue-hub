class Donations < ActiveRecord::Base
	
	belongs_to :animal
	belongs_to :donor
	
  attr_accessible :amount, :animal_id, :donor_id
end
