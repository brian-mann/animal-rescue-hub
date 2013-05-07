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

		it          { should have_selector('h1',     text: "Sign Up") }
		it          { should have_selector('title',  text: "Sign Up") }

		let(:submit) { "create-account" }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end

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

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end

			describe "after saving the user" do
			  before { click_button submit }
			  let(:user) { User.find_by_email('user@example.com') }

			  it { should have_selector('title', text: user.full_name) }
			  it { should have_selector('div.alert.alert-success', text: 'Welcome') }
			  it { should have_link('Sign Out') }
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
			it          { should have_selector('h1',     text: "Edit Profile") }
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
			it { should have_link('Sign Out', href: signout_path) }
			specify { user.reload.first_name.should  == new_first_name }
			specify { user.reload.last_name.should  == new_last_name }
			specify { user.reload.email.should == new_email }
		end
	end

end