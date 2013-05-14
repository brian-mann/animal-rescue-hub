namespace :db do
	desc "Fill user db with sample data"
	task populate: :environment do
		User.create!(first_name: "Example",
								last_name: "User",
								email: "example@rescuefunder.com",
								password: "foobar",
								password_confirmation: "foobar")
		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@rescuefunder.com"
			password = "password"
			User.create!(first_name: name,
									last_name: name,
									email: email,
									password: password,
									password_confirmation: password)
		end
	end
end