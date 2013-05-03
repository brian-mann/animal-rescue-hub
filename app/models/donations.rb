class Donations < ActiveRecord::Base
	
	belongs_to :animal
	belongs_to :donor
	
  attr_accessible :amount, :animal_id, :donor_id
end

# == Schema Information
#
# Table name: donations
#
#  id         :integer(4)      not null, primary key
#  donor_id   :integer(4)
#  animal_id  :integer(4)
#  amount     :integer(4)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

