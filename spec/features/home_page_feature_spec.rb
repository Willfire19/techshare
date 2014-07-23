require 'rails_helper'
# require 'pry'

RSpec.describe "Home Page" do

	subject { page }

	let(:user) { FactoryGirl.create(:user) }

	describe "before signing up" do

		before { visit root_path }

		it "has a signup button" do
			# assert_select ".btn-primary"
			expect(page).to have_link('Sign Up Here!', href: signup_path)
		end

		it "signup button goes to registration page" do
			click_link "Sign Up Here!"
			expect(current_path).to eq(signup_path)
			expect(page).to have_css( 'h2', :text => "Sign up")
		end

		describe "devices on home page:" do

			before(:all) do
				@user = FactoryGirl.create(:user)
				@device1 = Device.create!(:name => "Nexus 4", :availability => "Available", :user => @user)
			end

			it "should be able to go to created device", :js => true do
				visit device_path(@device1)
				expect(page).to have_content( @device1.name )
			end

			it "devices should be valid" do
				expect(@device1).to be_valid
			end

			it "devices should have a name", :js => true do
				visit root_path
				expect(page).to have_content( @device1.name )
			end

			after(:all) do
				@user.destroy
			end

		end

		describe "visiting profile page" do

				before { visit profile_path }

				it "should redirect back to home page" do
					expect(current_path).to eq(new_user_session_path)
				end

		end

		describe "after going to sign up page" do

			before do
				visit signup_path
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

			describe "home page" do
				
				before do
					sign_in_user(user)
					visit root_path
				end

				it "will not have a sign out link" do
					expect(page).to_not have_link('Sign Out Here!') 
				end

			end
		end

	end

	describe "after signing up" do

		before{ sign_in_user(user) }

		describe "visiting the profile page" do

			before{ visit profile_path }

			it "will display the user's email address" do
				expect(page).to have_css('h1', :text => user.email )
			end

			it "will have a link to sign out the user" do
				expect(page).to have_link('Sign Out')
			end

		end

	end

end