require 'rails_helper'

RSpec.describe HomeController, :type => :controller do

	describe "GET home page" do

		it "responds successfully" do
			get :home
			expect(response).to be_success
			expect(response.status).to eq(200)
		end
	end
	
end
