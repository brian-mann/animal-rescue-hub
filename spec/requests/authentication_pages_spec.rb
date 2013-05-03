require 'spec_helper'

describe "AuthenticationPages" do

	subject { page }

	describe "signin page" do
	  before { visit signin_path }

	  it { should have_selector('h1',    text: 'Sign In') }
	  it { should have_selector('title', text: 'Sign In') }

	  describe "with invalid information" do
	    before { click_button "sign_in" }

	    it { should have_selector('title', text: 'Sign In') }
	    it { should have_content('Incorrect') }
	  end
	end
end

describe "Authentication" do

  describe "signin" do
    before { visit signin_path }

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "sign_in"
      end

      it { should have_selector('title', text: user.full_name) }
      it { should have_link('Profile', href: user_path(user)) }
      it { should have_link('Sign Out', href: signout_path) }
      it { should_not have_link('Sign In', href: signin_path) }
    end
  end
end