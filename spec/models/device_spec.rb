require 'rails_helper'

RSpec.describe Device, :type => :model do

	let(:user) { FactoryGirl.create(:user) }
  let(:device) { FactoryGirl.create(:device, user: user) }

  it "has a valid factory" do
  	# FactoryGirl.build(:device, user: user).should be_valid	
  	expect(device).to be_valid
  end

end
