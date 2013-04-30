require 'spec_helper'

describe "User pages" do

  subject { page }

	describe "User Profile page" do
	  let(:user)  { FactoryGirl.create(:user) }
	  before      { visit user_path(user) }

	  it          { should have_selector('h1',     text: user.first_name) }
	  it          { should have_selector('title',  text: user.first_name) }
	end

end