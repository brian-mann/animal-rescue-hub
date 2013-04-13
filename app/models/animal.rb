class Animal < ActiveRecord::Base
  attr_accessible :age, :donation_id, :gender, :goal_amount, :goal_date, :name, :need_level_id, :nonprofit_id, :story, :type_id
end
