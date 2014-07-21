require 'rails_helper'

RSpec.describe "Admin" do

	let(:admin){ FactoryGirl.create(:admin) }

	describe "accessing profile page" do
		
		before do
			sign_in_user(admin)
			visit profile_path
		end

		it "displays the amount of users signed up" do
			expect(page).to have_content('Number of Users Signed Up')
		end

	end
	
end