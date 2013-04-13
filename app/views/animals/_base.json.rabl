attributes :id, :name, :age, :gender, :goal_date, :goal_amount, :type_id, :avatar

child :animal_type => :animal_type do
	attributes :name
end