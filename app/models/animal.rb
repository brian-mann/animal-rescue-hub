class Animal < ActiveRecord::Base
	
	scope :with_index, includes(:animal_type)
	
	belongs_to 	:animal_type
	belongs_to 	:nonprofit
	belongs_to 	:state
	has_many 		:donors, :through => :donations
	
  attr_accessible :age, :donation_id, :gender, :goal_amount, :goal_date, :name, :need_level_id, :nonprofit_id, :story, :animal_type_id, :avatar, :city, :state_id, :zip, :progress, :goal_progress
end

# == Schema Information
#
# Table name: animals
#
#  id             :integer(4)      not null, primary key
#  name           :string(255)
#  avatar         :string(255)
#  city           :string(255)
#  state_id       :integer(4)
#  zip            :string(255)
#  age            :integer(4)
#  gender         :boolean(1)
#  goal_date      :datetime
#  goal_amount    :integer(4)
#  goal_progress  :integer(4)
#  story          :text
#  nonprofit_id   :integer(4)
#  donation_id    :integer(4)
#  animal_type_id :integer(4)
#  need_level_id  :integer(4)
#  photo_id       :integer(4)
#  progress       :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

