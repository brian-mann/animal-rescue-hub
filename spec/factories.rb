FactoryGirl.define do
	factory :user do
		first_name	"Jason"
		last_name  "Smith"
		email	 "jasonsmith@example.com"
		password	"foobar1"
		password_confirmation	"foobar1"
	end
end