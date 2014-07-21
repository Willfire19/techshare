require 'rails_helper'

RSpec.describe HomeController, :type => :controller do

	describe "Profile:" do

		subject{ page }

		describe "Blah" do
		end
	end

	describe "Home:" do

		subject{ page }

		describe "Getting the profile page" do
			let(:user){ FactoryGirl.create(:user) }
			before{ sign_out user }

			describe "after signing up" do

				before{ sign_in user }

				it "responds successfully" do
					get :profile
					expect(response).to be_success
					expect(response.status).to eq(200)
				end

			end

		end

		describe "Getting the home page" do

			render_views

			it "responds successfully" do
				get :home
				expect(response).to be_success
				expect(response.status).to eq(200)
			end

			let(:user) { FactoryGirl.create(:user) }
			before { sign_in user }

			let(:valid_attributes) {
		    # skip("Add a hash of attributes valid for your model")
		    { "name" => "Nexus 4",
		      "availability" => "Available",
		      "user_id" => user.id }
  		}

  		let(:valid_session) { {} }
  		

  		it "assigns 2 devices to @devices" do
  			device1 = Device.create! valid_attributes
				device2 = Device.create! valid_attributes
	      get :home, {}, valid_session
	      expect(assigns(:devices)).to eq([device1, device2])
	    end

	    it "renders the _devices partial twice" do

	    	device1 = Device.create! valid_attributes
  			device2 = Device.create! valid_attributes
	    	# get :home, {}, valid_session
	    	get :home, {}, valid_session
	    	assert_template :partial => '_device_home', :count => 2
	    end

		end

		describe "Home route", :type => :feature do

			# before { visit root_path }

			it "should be the root path" do
				# page.source.should have_content('This is the home page')
				visit root_path
				# expect(rendered).to match "TechShare"
				expect(response).to render_template("home")
			end
		end

	end
	
end
