# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do
	Animal.create({
		name: Forgery::Name.first_name, 
		age: Forgery::Basic.number(at_least: 1, at_most: 20),
		gender: rand(0..1),
		goal_amount: rand(0..5000),
		story: Forgery::LoremIpsum.sentences(rand(1..5)),
		animal_type_id: rand(1..5),
	})
end

%W{ bird dog cat rabbit exotic}.each do |type|
	AnimalType.create name: type
end