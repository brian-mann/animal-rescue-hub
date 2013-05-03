require 'spec_helper'

describe "AuthenticationPages" do

	subject { page }

	describe "signin page" do
	  before { visit signin_path }

	  it { should have_selector('h1',    text: 'Sign In') }
	  it { should have_selector('title', text: 'Sign In') }

	  describe "with invalid information" do
	    before { click_button "Sign In" }

	    it { should have_selector('title', text: 'Sign In') }
	    it { should have_content('incorrect') }
	  end
	end


end
