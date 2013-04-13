class Animal < ActiveRecord::Base
	
	scope :with_index, includes(:animal_type)
	
	belongs_to 	:animal_type
	belongs_to 	:nonprofit
	belongs_to 	:state
	has_many 		:donors, :through => :donations
	
  attr_accessible :age, :donation_id, :gender, :goal_amount, :goal_date, :name, :need_level_id, :nonprofit_id, :story, :animal_type_id, :avatar, :city, :state_id, :zip
end
