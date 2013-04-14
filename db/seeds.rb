# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

avatars = (1..11).to_a

numbers = (1..10).to_a.map { |num| num * 10 }
numbers << (1..40).to_a.map { |num| num * 50  }
numbers.flatten!.uniq!

animals = {
	dog: 		{ type: 2, count: 4 },
	cat: 		{ type: 3, count: 6 },
	other: 	{ type: 4, count: 2 },
}

animals.each do |key, hash|
	hash[:count].times do |num|
		num += 1

		Animal.create({
			name: Forgery::Name.first_name, 
			age: Forgery::Basic.number(at_least: 1, at_most: 20),
			gender: rand(0..1),
			goal_amount: numbers.delete(numbers.sample),
			story: Forgery::LoremIpsum.paragraphs(rand(1..3)),
			animal_type_id: hash[:type],
			avatar: "#{key}/#{key.to_s.capitalize_first}#{num}.jpg",
			city: Forgery::Address.city,
			state_id: rand(1..51),
			zip: Forgery::Address.zip,
			progress: rand(5..100).to_s + "%",
		})
	end
end

birds = [
	{name: "Chimes"},
	{name: "Fernando"},
	{name: "Joey"},
	{name: "Kili"},
	{name: "Persephone"},
	{name: "Sully"},      
	{
		name: "Sebastian", story: <<-eos Sebastian was found on a local buy/sell paper offering a cockatoo for cheap. After posting about it and forwarding me a photo, it was clear this bird has a severe prolapse that needs medical attention.</p> 

<p>Sebastian was living in a 10 x 10 shack with a dozen other birds in a small 18 x 18 rusty cage, with no toys, a single perch, sunflower seed diet, and a prolapse. This is a severe prolapse and the owners claim it has been 'like that' for the past 6 months. The bird has been outside in this unheated shack during 20 degree weather.</p>

<p>Between my friend, myself, and a group of online bird buddies I networked and scraped together a ransom fee for the bird, as well as located a rescue willing to take him in.</p>

<p>After about 6 hours of driving, collecting the bird, dropping him off to quarantine at a friends house (a no pet household), we arrived home. Sebastian was then transported to Miss Vicki’s Parrot Village, to a rescue in Georgia, where he already has a vet appointment lined up. The trip was an 8 hours long drive time.</p>

<p>We took Sebastian to the vet. He did great, and he was so excited to be home that he stepped up out of their carriers!</p>

<p>The prognosis for Sebastian is not so good, but his Veterinarian is helping us work with him. She sutured his vent, gave him some pain meds and antibiotics, and even trimmed his nails while he was under anesthesia...I am sure he is grateful for that.</p>

<p>We are going to give him the best shot possible. Hopefully getting him on a good diet and in a healthy atmosphere will help him improve enough where his quality of life is not inhumane.</p>

<p>He will be going back in for another surgery, but we are going to work with the other issues while these sutures are in place. Please keep him in your thoughts, and we will keep you posted daily!
eos
	},
]

birds.each do |bird|
	Animal.create({
		name: bird[:name],
		age: Forgery::Basic.number(at_least: 1, at_most: 20),
		gender: rand(0..1),
		goal_amount: numbers.delete(numbers.sample),
		story: ( bird[:story].present? ? bird[:story] : Forgery::LoremIpsum.paragraphs(rand(1..3)) ),
		animal_type_id: 1,
		avatar: "bird/#{bird[:name]}.jpg",
		city: "Atlanta",
		state_id: 11,
		zip: "30214",
		progress: rand(5..100).to_s + "%",
	})
end

# 10.times do
# 	avatar = avatars.delete(avatars.sample).to_s + ".jpg"
# 	file = File.open("app/assets/images/preview/#{avatar}")
# 	image = Magick::Image.read(file).first
# 	
# 	
# 	Animal.create({
# 		name: Forgery::Name.first_name, 
# 		age: Forgery::Basic.number(at_least: 1, at_most: 20),
# 		gender: rand(0..1),
# 		goal_amount: rand(0..5000),
# 		story: Forgery::LoremIpsum.sentences(rand(1..5)),
# 		animal_type_id: rand(1..4),
# 		avatar: avatar,
# 		city: Forgery::Address.city,
# 		state_id: rand(1..51),
# 		zip: Forgery::Address.zip,
# 		avatar_width: image.columns,
# 		avatar_height: image.rows,
# 	})
# end

%W{ bird dog cat other }.each do |type|
	AnimalType.create name: type
end

State.create([
	{ :name => 'Alabama', :abbr => 'AL', :ansi_code => '1', :statens => '1779775'},
	{ :name => 'Alaska', :abbr => 'AK', :ansi_code => '2', :statens => '1785533'},
	{ :name => 'Arizona', :abbr => 'AZ', :ansi_code => '4', :statens => '1779777'},
	{ :name => 'Arkansas', :abbr => 'AR', :ansi_code => '5', :statens => '68085'},
	{ :name => 'California', :abbr => 'CA', :ansi_code => '6', :statens => '1779778'},
	{ :name => 'Colorado', :abbr => 'CO', :ansi_code => '8', :statens => '1779779'},
	{ :name => 'Connecticut', :abbr => 'CT', :ansi_code => '9', :statens => '1779780'},
	{ :name => 'Delaware', :abbr => 'DE', :ansi_code => '10', :statens => '1779781'},
	{ :name => 'District of Columbia', :abbr => 'DC', :ansi_code => '11', :statens => '1702382'},
	{ :name => 'Florida', :abbr => 'FL', :ansi_code => '12', :statens => '294478'},
	{ :name => 'Georgia', :abbr => 'GA', :ansi_code => '13', :statens => '1705317'},
	{ :name => 'Hawaii', :abbr => 'HI', :ansi_code => '15', :statens => '1779782'},
	{ :name => 'Idaho', :abbr => 'ID', :ansi_code => '16', :statens => '1779783'},
	{ :name => 'Illinois', :abbr => 'IL', :ansi_code => '17', :statens => '1779784'},
	{ :name => 'Indiana', :abbr => 'IN', :ansi_code => '18', :statens => '448508'},
	{ :name => 'Iowa', :abbr => 'IA', :ansi_code => '19', :statens => '1779785'},
	{ :name => 'Kansas', :abbr => 'KS', :ansi_code => '20', :statens => '481813'},
	{ :name => 'Kentucky', :abbr => 'KY', :ansi_code => '21', :statens => '1779786'},
	{ :name => 'Louisiana', :abbr => 'LA', :ansi_code => '22', :statens => '1629543'},
	{ :name => 'Maine', :abbr => 'ME', :ansi_code => '23', :statens => '1779787'},
	{ :name => 'Maryland', :abbr => 'MD', :ansi_code => '24', :statens => '1714934'},
	{ :name => 'Massachusetts', :abbr => 'MA', :ansi_code => '25', :statens => '606926'},
	{ :name => 'Michigan', :abbr => 'MI', :ansi_code => '26', :statens => '1779789'},
	{ :name => 'Minnesota', :abbr => 'MN', :ansi_code => '27', :statens => '662849'},
	{ :name => 'Mississippi', :abbr => 'MS', :ansi_code => '28', :statens => '1779790'},
	{ :name => 'Missouri', :abbr => 'MO', :ansi_code => '29', :statens => '1779791'},
	{ :name => 'Montana', :abbr => 'MT', :ansi_code => '30', :statens => '767982'},
	{ :name => 'Nebraska', :abbr => 'NE', :ansi_code => '31', :statens => '1779792'},
	{ :name => 'Nevada', :abbr => 'NV', :ansi_code => '32', :statens => '1779793'},
	{ :name => 'New Hampshire', :abbr => 'NH', :ansi_code => '33', :statens => '1779794'},
	{ :name => 'New Jersey', :abbr => 'NJ', :ansi_code => '34', :statens => '1779795'},
	{ :name => 'New Mexico', :abbr => 'NM', :ansi_code => '35', :statens => '897535'},
	{ :name => 'New York', :abbr => 'NY', :ansi_code => '36', :statens => '1779796'},
	{ :name => 'North Carolina', :abbr => 'NC', :ansi_code => '37', :statens => '1027616'},
	{ :name => 'North Dakota', :abbr => 'ND', :ansi_code => '38', :statens => '1779797'},
	{ :name => 'Ohio', :abbr => 'OH', :ansi_code => '39', :statens => '1085497'},
	{ :name => 'Oklahoma', :abbr => 'OK', :ansi_code => '40', :statens => '1102857'},
	{ :name => 'Oregon', :abbr => 'OR', :ansi_code => '41', :statens => '1155107'},
	{ :name => 'Pennsylvania', :abbr => 'PA', :ansi_code => '42', :statens => '1779798'},
	{ :name => 'Rhode Island', :abbr => 'RI', :ansi_code => '44', :statens => '1219835'},
	{ :name => 'South Carolina', :abbr => 'SC', :ansi_code => '45', :statens => '1779799'},
	{ :name => 'South Dakota', :abbr => 'SD', :ansi_code => '46', :statens => '1785534'},
	{ :name => 'Tennessee', :abbr => 'TN', :ansi_code => '47', :statens => '1325873'},
	{ :name => 'Texas', :abbr => 'TX', :ansi_code => '48', :statens => '1779801'},
	{ :name => 'Utah', :abbr => 'UT', :ansi_code => '49', :statens => '1455989'},
	{ :name => 'Vermont', :abbr => 'VT', :ansi_code => '50', :statens => '1779802'},
	{ :name => 'Virginia', :abbr => 'VA', :ansi_code => '51', :statens => '1779803'},
	{ :name => 'Washington', :abbr => 'WA', :ansi_code => '53', :statens => '1779804'},
	{ :name => 'West Virginia', :abbr => 'WV', :ansi_code => '54', :statens => '1779805'},
	{ :name => 'Wisconsin', :abbr => 'WI', :ansi_code => '55', :statens => '1779806'},
	{ :name => 'Wyoming', :abbr => 'WY', :ansi_code => '56', :statens => '1779807'}
])