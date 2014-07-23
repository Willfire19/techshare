require 'rails_helper'

RSpec.describe "Reservation" do

	# let(:borrower){ FactoryGirl.create(:user) }
	# let(:lender){ FactoryGirl.create(:user, email: "lender@example.com") }
	# let(:device){ FactoryGirl.create(:device, user: lender) }
	# before{ sign_in_user(borrower) }

	describe "clicking on availability of device to reserve the device" do

		describe "on the home page" do
			before(:all) do
				@borrower = FactoryGirl.create(:user, email: "borrower@email.com")
				@lender = FactoryGirl.create(:user, email: "lender@email.com")
				@device = FactoryGirl.create(:device, user: @lender)
				# visit root_path
			end

			it "borrower and lender should be valid" do
				expect(@borrower).to be_valid
				expect(@lender).to be_valid
			end

			it "device should be valid" do
				expect(@device).to be_valid
			end

			it "will have a device on the home page", :js => true do
				visit root_path
				expect(page).to have_content("Nexus 5")
			end

			it "will go to the new reservation page", :js => true do
				visit root_path
				click_link @device.availability
				expect(current_path).to eq(new_reservation_path)
			end

			after(:all) do
				@borrower.destroy
				@lender.destroy
			end

		end

	end

end