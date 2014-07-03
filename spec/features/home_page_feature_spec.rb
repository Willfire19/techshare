require 'rails_helper'

RSpec.describe "Home Page" do

	# describe "Home page", :type => :request do
	let(:user) { FactoryGirl.create(:user) }

	describe "before signing up" do

		before { visit root_path }

		it "has a signup button" do
			# assert_select ".btn-primary"
			expect(page).to have_link('Sign Up Here!', href: sign_up_path)
		end

		it "signup button goes to registration page" do
			click_link "Sign Up Here!"
			expect(current_path).to eq(sign_up_path)
			expect(page).to have_css( 'h2', :text => "Sign up")
		end

		describe "devices on home page:" do
			let(:device1){ FactoryGirl.create(:device, user: user) }
			let(:device2){ FactoryGirl.create(:device, user: user) }

			it "devices should be valid" do
				expect(device1).to be_valid
				expect(device2).to be_valid
			end

		end

		describe "after going to sign up page" do

			before do
				visit sign_up_path
				fill_in "Email", with: "example@gmail.com"
				fill_in "Password", with: user.password
				fill_in "Password Confirmation", with: user.password_confirmation
			end

			it "signing up will redirect back to home page" do
				click_button "Sign up"
				expect(current_path).to eq(root_path)
				expect(page).to have_css('h1', :text => "TechShare")
				expect(page).to have_css('h3', :text => "Thanks for Signing Up! We are still setting things up, but we will email you when we are ready! Don't forget to check out our Facebook page and our Twitter!")
			end
		end

		describe "Profile Page" do

			before { visit profile_path }

			it "should redirect back to home page" do
				expect(current_path).to eq(root_path)
			end

		end

	end
	
end