require 'spec_helper'

describe User do

	before { @user = User.new(first_name: "Example", last_name: "User", email: "user@example.com", password: "foobar", password_confirmation: "foobar", accept_terms: true) }

	subject { @user }

	# Verifying that the entire User model is valid---------------------------------------------------------
	it { should be_valid }
	it { should_not be_admin }

	describe "with admin attribute set to 'true'" do
	  before do
	    @user.save!
	    @user.toggle!(:admin)
	  end

	  it { should be_admin }
	end

	describe "when Accepts Terms is not true" do
		before 	{ @user.accept_terms = false }
		it 			{ should_not be_valid }
	end

	# Test for email format validation-----------------------------------------------------------------------------
	describe "when Email format is invalid" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com]
			addresses.each do |invalid_address|
				@user.email = invalid_address
				@user.should_not be_valid
			end
		end
	end

	describe "when email format is valid" do
		it "should be valid" do
			addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
			addresses.each do |valid_address|
				@user.email = valid_address
				@user.should be_valid
			end
		end
	end

	# A test for the rejection of duplicate email addresses & be case-insensitive.------------------------------------------------------
	describe "when Email address is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end

		it { should_not be_valid }
	end

	# Test for mismatched password & password_confirmation-----------------------------------------------------------------------------
	describe "when Password doesn't match Password Confirmation" do
		before 	{ @user.password_confirmation = "mismatch" }
		it 			{ should_not be_valid }
	end

	# Test to not allow for nil password_confirmation to be set-----------------------------------------------------------------------------
	describe "when Password Confirmation is nil" do
		before 	{ @user.password_confirmation = nil }
		it 			{ should_not be_valid }
	end

	# Test for valid (nonblank) remember token-----------------------------------------------------------------------------
	describe "remember token" do
		before 								{ @user.save }
		its(:remember_token) 	{ should_not be_blank }
	end

	# Authenticate user tests-----------------------------------------------------------------------------
	describe "return value of authenticate method" do
		before 						{ @user.save }
		let(:found_user) 	{ User.find_by_email(@user.email) }

		describe "with valid password" do
			it 							{ should == found_user.authenticate(@user.password) }
		end

		describe "with invalid password" do
			let(:user_for_invalid_password) 	{ found_user.authenticate("invalid") }

			it 							{ should_not == user_for_invalid_password }
			specify 				{ user_for_invalid_password.should be_false }
		end
	end

end




# == Schema Information
#
# Table name: users
#
#  id              :integer(4)      not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#  accept_terms    :boolean(1)
#  remember_token  :string(255)
#  admin           :boolean(1)      default(FALSE)
#

