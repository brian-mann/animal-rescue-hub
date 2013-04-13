attributes :id, :name, :age, :gender, :goal_date, :goal_amount, :type_id, :avatar, :city, :zip, :animal_type_id, :avatar_width, :avatar_height

child :animal_type => :animal_type do
	attributes :name
end

child :state => :state do
	attributes :name, :abbr
end