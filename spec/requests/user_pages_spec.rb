require 'spec_helper'

describe "User pages" do

  subject { page }

	describe "User Profile page" do
	  let(:user)  { FactoryGirl.create(:user) }
	  before      { visit user_path(user) }

	  it          { should have_selector('h1',     text: user.first_name) }
	  it          { should have_selector('title',  text: user.first_name) }
	end

	describe "Sign Up page" do

		before { visit signup_path }

		let(:submit) { "Create my Account" }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "First Name",						with: "Example"
				fill_in "Last Name",						with: "User"
				fill_in "Email",								with: "user@example.com"
				fill_in "Password",							with: "foobar"
				fill_in "PW Confirmation",			with: "foobar"
			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end
		end
	end
end