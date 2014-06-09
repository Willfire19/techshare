require 'rails_helper'

RSpec.describe HomeController, :type => :controller do

	describe "Home:" do

		subject{ page }

		describe "Getting the home page" do
			it "responds successfully" do
				get :home
				expect(response).to be_success
				expect(response.status).to eq(200)
			end

			let(:valid_attributes) {
		    # skip("Add a hash of attributes valid for your model")
		    { "name" => "Nexus 4" }
  		}

  		let(:valid_session) { {} }

  		it "assigns 3 devices to @devices" do
  			device = Device.create! valid_attributes
  			device2 = Device.create! valid_attributes
	      get :home, {}, valid_session
	      expect(assigns(:devices)).to eq([device, device2])
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
