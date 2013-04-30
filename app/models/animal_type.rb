class AnimalType < ActiveRecord::Base
	
	has_many :animals
	
  attr_accessible :name
end

# == Schema Information
#
# Table name: animal_types
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

