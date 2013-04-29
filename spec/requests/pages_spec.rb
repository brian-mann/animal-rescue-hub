require 'spec_helper'

describe "Pages" do

  subject { page }
	
  describe "Signup" do

    before { visit signup_path }

  	it { should have_selector('h1',      :text => 'Sign Up') }
  	it { should have_selector('title',   :text => "Sign Up") }

  end
end