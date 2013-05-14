require 'spec_helper'

describe "User pages" do

  subject { page }

	describe "User Profile page" do
	  let(:user)  { FactoryGirl.create(:user) }
	  before      { visit user_path(user) }

	  it          { should have_selector('title',  text: user.first_name) }
	end

	describe "Sign Up page" do

		before { visit signup_path }

		let(:submit) { "create-account" }

		describe "with invalid information" do

			describe "after submission" do
			  before { click_button submit }

			  it { should have_selector('title', text: 'Sign Up') }
			  it { should have_content('errors') }
			end
		end

		describe "with valid information" do
			before do
				fill_in "First Name",						with: "Example"
				fill_in "Last Name",						with: "User"
				fill_in "Email",								with: "user@example.com"
				fill_in "Password",							with: "foobar"
				fill_in "Confirm Password",			with: "foobar"
				check "user_accept_terms"
			end

			describe "after saving the user" do
			  before { click_button submit }
			  let(:user) { User.find_by_email('user@example.com') }

			  it { should have_selector('title', text: user.full_name) }
			  it { should have_button('Sign Out') }
			end

		end
	end

	describe "Edit" do
		let(:user)  { FactoryGirl.create(:user) }
		before do
		  sign_in user
		  visit edit_user_path(user)
		end

		describe "page" do
			it          { should have_selector('title',  text: "Edit Profile") }
		end

		describe "with invalid information" do
			before 	{ click_button "Save Changes" }

			it 			{ should have_content('error') }
		end

		describe "with valid information" do
			let(:new_first_name) 		{ "New"}
			let(:new_last_name) 		{ "Name"}
			let(:new_email) 				{ "new@example.com"}
			before do
				fill_in "First Name", 					with: new_first_name
				fill_in "Last Name", 						with: new_last_name
				fill_in "Email", 								with: new_email
				fill_in "Password", 						with: user.password
				fill_in "Confirm Password", 		with: user.password
				click_button "Save Changes"
			end

			it { should have_selector('title', text: new_first_name) }
			it { should have_selector('div.alert.alert-success') }
			it { should have_button('Sign Out') }
			specify { user.reload.first_name.should  == new_first_name }
			specify { user.reload.last_name.should  == new_last_name }
			specify { user.reload.email.should == new_email }
		end
	end

end