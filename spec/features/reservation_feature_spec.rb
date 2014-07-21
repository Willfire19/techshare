require 'rails_helper'

RSpec.describe "Reservation" do

	let(:borrower){ FactoryGirl.create(:user) }
	let(:lender){ FactoryGirl.create(:user, :email => "lender@example.com") }
	let(:device){ FactoryGirl.create(:device, :user => lender) }
	# before{ sign_in_user(borrower) }

	describe "clicking on availability of device to reserve the device" do

		describe "on the home page" do
			before{ visit root_path }

			it "will go to the new reservation page" do
				click_link device.availability
				expect(current_path).to eq(new_reservation_path)
			end

		end

	end

end