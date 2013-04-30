require 'spec_helper'

describe User do
  
	before { @user = User.new(first_name: "Example", last_name: "User", email: "user@example.com") }

	subject { @user }

	it { should respond_to(:first_name) }
	it { should respond_to(:last_name) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }

	# Verifying that the entire User model is valid----------------------------------------------------------
	it { should be_valid }

	# First sets attr to be invalid (black) valie, then tests to see that resulting object is invalid--------
	describe "when First Name is not present" do
		before  { @user.first_name = " " }
		it 			{ should_not be_valid }
	end

	describe "when Last Name is not present" do
		before  { @user.last_name = " " }
		it 			{ should_not be_valid }
	end

	describe "when Email is not present" do
		before  { @user.email = " " }
		it 			{ should_not be_valid }
	end

	# Test for length validation-----------------------------------------------------------------------------
	describe "when First Name is too long" do
		before 	{ @user.first_name = "a" * 51 }
		it 			{ should_not be_valid }
	end

	describe "when Last Name is too long" do
		before 	{ @user.last_name = "z" * 51 }
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

end

# == Schema Information
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

